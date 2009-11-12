From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCHv2 3/3] mpc52xx/wdt: remove obsolete old WDT implementation
Date: Thu, 12 Nov 2009 13:43:01 -0700
Message-ID: <fa686aa40911121243i147b7962l5a249687f8e5d201@mail.gmail.com>
References: <20091112195646.GB13350@pengutronix.de> <1258058202.2192.1@antares>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1258058202.2192.1@antares>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Cc: Linux PPC Development <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Devicetree Discussions <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 12, 2009 at 1:36 PM, Albrecht Dre=DF <albrecht.dress-KvP5wT2u2U0@public.gmane.org> =
wrote:
> Hi Wolfram:
>
> Am 12.11.09 20:56 schrieb(en) Wolfram Sang:
>>
>> > Note: The file drivers/watchdog/mpc5200_wdt.c is now obsolete and shou=
ld
>> > be removed.
>>
>> Ehrm, this is possible within a patch :)
>
> Ummm, I tried that (removed the file from git locally), but apparently I'm
> too dumb to find the proper options to get this into the diff (to my
> defence, I'm still using cvs/svn for my projects). =A0Can you give me a h=
int?
>
>> > =A0config MPC5200_WDT
>> > - =A0 =A0 tristate "MPC5200 Watchdog Timer"
>> > + =A0 =A0 bool "MPC52xx Watchdog Timer"
>> > =A0 =A0 =A0 depends on PPC_MPC52xx
>> > + =A0 =A0 help
>> > + =A0 =A0 =A0 Use General Purpose Timer (GPT) 0 on the MPC5200 as Watc=
hdog.
>>
>> s/5200/52xx/ here too.
>
> Yes, you're right. =A0The config option should still be 'MPC5200_WDT', th=
ough,
> as otherwise all the default configs had to be touched - IMO, on the low
> level, this does no harm. =A0Thoughts?

I don't care.  Don't bother respinning just for this.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
