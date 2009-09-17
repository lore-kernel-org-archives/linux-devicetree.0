From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Gpio reset handling
Date: Thu, 17 Sep 2009 07:42:25 -0600
Message-ID: <fa686aa40909170642j63ccef7bnf162cb88b9733023@mail.gmail.com>
References: <4AAFDDD1.9070702@monstr.eu>
	<fa686aa40909151527r36334528ne1194523f141a8a2@mail.gmail.com>
	<1d3f23370909151540p411f0bc0r1c81b68ceb2fb45e@mail.gmail.com>
	<fa686aa40909151607u29d4025ay101e89d9eae5f30a@mail.gmail.com>
	<4AB1DB2A.6050109@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4AB1DB2A.6050109-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 17, 2009 at 12:46 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> Grant Likely wrote:
>> From what I've heard so far, I'd do it the same way but use something
>> like "xlnx,microblaze-gpio-reset" for the compatible value. =A0As long
>> as you document the binding and post it to the devicetree-discuss
>> mailing list for review you should have no problem doing what you want
>> to do.
>>
>> BTW, start with the "xlnx,microblaze-*" value for now. =A0A architecture
>> neutral value can always be chosen at a later date if this proves to
>> be useful.
>
> Here I see some problems if we want to use one reset gpio pin with leds.
> It not happen in these days but I expect to use it with heartbeat led.
>
> If I want to use new compatible node, I have to change BSP to support this
> but I can through out this part of code very soon. And if I want to use
> that node with leds then this is wrong.

I think you misunderstand me.  I'm saying create a new node which
references a gpio from the gpio node.  So it would look something like
this (adapting your original example):

               gpio_res: gpio@81400000 {
                       compatible =3D "xlnx,xps-gpio-1.00.a";
                       interrupt-parent =3D <&xps_intc_0>;
                       interrupts =3D < 7 2 >;
                       reg =3D < 0x81400000 0x10000 >;
...
                       xlnx,gpio-width =3D <0x8>;
...
               } ;

gpio-leds {
       compatible =3D "gpio-leds";
       heartbeat {
               label =3D "Heartbeat";
               gpios =3D <&gpio_res 4 1>;
               linux,default-trigger =3D "heartbeat";
       };

       green {
               label =3D "Green";
               gpios =3D <&gpio_res 5 1>;
       };
};

reset {
       compatible =3D "xlnx,microblaze-reset";
       soft-reset-gpio =3D <&gpio_res 1 1>;
       phy-reset-gpio =3D <&gpio_res 2 1>;
}

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
