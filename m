From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
 variables & arrays
Date: Sun, 11 Nov 2012 22:57:08 +0530
Message-ID: <CAKohpoksQ4ShO_QFAQORO2_oEgNtOeENFnX1C3gN_5POQSGexg@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
	<50991C41.50705@gmail.com>
	<CAOh2x==LNuSFftB1r8cyJ6TOqOVJfExMTUVxKZnS16wL4B8eBA@mail.gmail.com>
	<509FB25F.3030307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <509FB25F.3030307@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: rob.herring@calxeda.com, grant.likely@secretlab.ca, linaro-dev@lists.linaro.org, andriy.shevchenko@intel.com, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11 November 2012 19:42, Rob Herring <robherring2@gmail.com> wrote:
> On 11/06/2012 10:22 PM, viresh kumar wrote:

>>                 cluster0: cluster@0 {
>> +                       data1 = <0x50 0x60 0x70>;
>> +                       data2 = <0x5000 0x6000 0x7000>;
>> +                       data3 = <0x50000000 0x60000000 0x70000000>;
>
> So there is a mismatch in our assumptions. You are just truncating
> 32-bit values. I assumed you were using the 8 and 16 bit sizes that are
> now supported in dts. I don't think we should just truncate values
> blindly. We have support for specifying 8 and 16 values now so you
> should use that and define that as part of a binding.

Sorry couldn't get your point at all :(
What did you mean by "truncating 32 bit values" and how should we
tell via DT, that the value passed is 8 bit, 16 bit or 32 bit?

--
viresh
