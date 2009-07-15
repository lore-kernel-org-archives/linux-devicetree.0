From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2] add Mac OS X support
Date: Wed, 15 Jul 2009 12:26:47 -0500
Message-ID: <ed82fe3e0907151026w4c957398s63ce7d8dae7c5460@mail.gmail.com>
References: <ed82fe3e0905252037r574e56ecjd8689b800c74561f@mail.gmail.com>
	<1243361246-1743-1-git-send-email-plagnioj@jcrosoft.com>
	<20090613192148.GN25406@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090613192148.GN25406-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jon, are you still updating dtc.git?

On Sat, Jun 13, 2009 at 2:21 PM, Jean-Christophe
PLAGNIOL-VILLARD<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 20:07 Tue 26 May =A0 =A0 , Jean-Christophe PLAGNIOL-VILLARD wrote:
>> use dylib shared lib extention
>> allow to specifiy os specific shared lib link option
>> Mac OS use -dynamiclib instead of -shared, -install_name instead of -son=
ame
>> and does not support --version-script
>>
>> add HOSTOS macro to detect the current os you are
>>
>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>> ---
> jdl do you have any plan to apply it?
>
> Best Regards,
> J.
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
>



-- =

Timur Tabi
Linux kernel developer at Freescale
