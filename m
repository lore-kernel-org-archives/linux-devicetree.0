From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
 variables & arrays
Date: Mon, 19 Nov 2012 09:24:58 +0530
Message-ID: <CAKohponUt4264UaxM2Wr41=fbPJkUCFhKhOapjPQC=OYDuyMbQ@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
	<50991C41.50705@gmail.com>
	<CAOh2x==LNuSFftB1r8cyJ6TOqOVJfExMTUVxKZnS16wL4B8eBA@mail.gmail.com>
	<509FB25F.3030307@gmail.com>
	<CAKohpoksQ4ShO_QFAQORO2_oEgNtOeENFnX1C3gN_5POQSGexg@mail.gmail.com>
	<509FFF8B.3010707@gmail.com>
	<CAKohponUFABC397w=dq7j+1f5QeiOX4BCOXv=OZSNOaOTmt9oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKohponUFABC397w=dq7j+1f5QeiOX4BCOXv=OZSNOaOTmt9oQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: rob.herring@calxeda.com, grant.likely@secretlab.ca, linaro-dev@lists.linaro.org, andriy.shevchenko@intel.com, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12 November 2012 09:03, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 12 November 2012 01:12, Rob Herring <robherring2@gmail.com> wrote:
>> I don't think the size is stored in the dtb. It is only in the dts. You
>> need to define the size in the binding definitions and use '/bits/'
>> annotation. With this the data is packed. Then the array function used
>> should match what the binding defines.

Hi Rob,

Can you please help me in getting the correct format to do this from dts.
I tried:

data1 = /bits/ 8 <0x50 0x60 0x70>;

as written in your earlier mail... but it didn't worked. Tried to
search too, but
couldn't find it.
