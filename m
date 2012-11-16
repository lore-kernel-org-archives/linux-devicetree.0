From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of_i2c: I2C child node 10-bit client addressing
Date: Fri, 16 Nov 2012 14:09:03 +0000
Message-ID: <CACxGe6v3CY7fv50-Z-vRPB=TWgrkAgw6S2YkHpg6RG_gA76Rpw@mail.gmail.com>
References: <1352972157-21299-1-git-send-email-bharat_404@hotmail.com>
 <CACxGe6uSWy0-qZ3qYk5kfZzkxuyeZn0HMuzz+UU=6bGtGds1Hw@mail.gmail.com>
 <BLU002-W228A2064248B1A622AA97D6AC510@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BLU002-W228A2064248B1A622AA97D6AC510-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2012 at 1:12 PM, Bharat Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> I guess the I2C spec does not restricts.(A device to have an address that
> fits in the first 7 bits, but still requires 10 bit address transactions)
>
> But I don't think their will be any I2C slave doing this.
>
> Why a 7 bit slave want to have extra byte for every transaction?

It is possible for there to be devices that use 10 bit addressing, but
have a configurable address.

g.

>
> Note: I am on vacation with limited e-mail access. I will be back on Nov 26.
>
> Thanks,
> -Bharat
>
>
>> From: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
>> Date: Thu, 15 Nov 2012 16:53:59 +0000
>> Subject: Re: [PATCH] of_i2c: I2C child node 10-bit client addressing
>> To: bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
>> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; jochen-NIgtFMG+Po8@public.gmane.org;
>> jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>
>>
>> On Thu, Nov 15, 2012 at 9:35 AM, <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
>> > From: Bharat Kumar Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
>> >
>> > I2C clients which has 10 bit address, struct i2c_board_info,
>> > member "flags = I2C_CLIENT_TEN" is needed.
>> >
>> > Signed-off-by: Bharat Kumar Reddy <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
>>
>> Did you see my questions from yesterday?
>>
>> g.
>>
>> >
>> > diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
>> > index 3550f3b..28c5566 100644
>> > --- a/drivers/of/of_i2c.c
>> > +++ b/drivers/of/of_i2c.c
>> > @@ -57,6 +57,10 @@ void of_i2c_register_devices(struct i2c_adapter
>> > *adap)
>> > continue;
>> > }
>> >
>> > + /* Support for i2c 10 bit client address */
>> > + if ((info.addr > (1 << 7) - 1) && (info.addr <= (1 << 10) - 1))
>> > + info.flags = I2C_CLIENT_TEN;
>> > +
>> > info.irq = irq_of_parse_and_map(node, 0);
>> > info.of_node = of_node_get(node);
>> > info.archdata = &dev_ad;
>> > --
>> > 1.7.6
>> >
>> >
>>
>>
>>
>> --
>> Grant Likely, B.Sc., P.Eng.
>> Secret Lab Technologies Ltd.



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
