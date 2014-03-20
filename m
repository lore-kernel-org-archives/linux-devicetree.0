From: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/8] ASoC: atmel: document clock properties of the wm8904
 driver
Date: Thu, 20 Mar 2014 10:37:53 +0800
Message-ID: <532A5481.6000008@atmel.com>
References: <1395049541-28128-1-git-send-email-voice.shen@atmel.com> <1395049541-28128-8-git-send-email-voice.shen@atmel.com> <20140317115518.GD11706@sirena.org.uk> <532931C3.4080909@atmel.com> <20140319102800.GW11706@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140319102800.GW11706-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 03/19/2014 06:28 PM, Mark Brown wrote:
> On Wed, Mar 19, 2014 at 01:57:23PM +0800, Bo Shen wrote:
>> On 03/17/2014 07:55 PM, Mark Brown wrote:
>
>>> If this is a clock for the CODEC it should be documented as part of the
>>> binding for the CODEC and connected to the CODEC in the device tree
>>> rather than being part of a machine driver binding.
>
>> This is a optional clock for CODEC which depends on hardware design. There
>> are 3 options for this clock, wm8904 as an example.
>> 1. Using internal FLL, so won't use this clock.
>> 2. Using external oscillator, no need to retrieve this clock.
>> 3. Using SoC provide this clock (we use this case).
>
>> After considering these 3 options, if we put this into CODEC driver to do
>> it, I think it will be more complicate to do logic judgement. Do you think
>> so?
>
> There shouldn't be any meaningful complexity from the above cases -
> cases 2 and 3 are the same and if the clock isn't used at all then it
> can be omitted.  If the FLL is clocked from MCLK then the CODEC driver
> should be able to work out how to configure it easily, the device isn't
> like a digital hub CODEC with lots of clocking options.

For this, in my mind, I think we need add following parameters in DT.
1. sysclk_src_from_fll --> we need do nothing.
2. sysclk_src_from_mclk
    2.1 use_external_xtal --> we need clock_frequency
    2.2 !use_external_xtal --> we need retrieve clock and clock_frequency.

So, the dt may looks like:
for case 1:
wm8904: wm8904@1a {
	reg = <0x1a>;
	sysclk_src_from_fll;
}

for case 2.1:
wm8904: wm8904@1a {
	reg = <0x1a>;
	sysclk_src_from_mclk;
	use_external_xtal;
	clock_frequency = 12000000;
}

for case 2.2:
wm8904: wm8904@1a {
	reg = <0x1a>;
	sysclk_src_from_mclk;
	clocks = <&pck0>;
	clock-names = "mclk";
	clock_frequency = 32768;
}

Does this acceptable? Or any other better suggestion for this?

Best Regards,
Bo Shen

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
