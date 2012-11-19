From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH Resend V2] dt: add helper function to read u8 & u16
 variables & arrays
Date: Mon, 19 Nov 2012 12:11:11 +0530
Message-ID: <CAKohpo=XZ_uXJPUr2dJFBQBWnkRyV2YepikrWZ2GdrPXEmEmYw@mail.gmail.com>
References: <64c5278ebdec503f83e9b7002bf13affb7f3260f.1351225085.git.viresh.kumar@linaro.org>
	<50991C41.50705@gmail.com>
	<CAOh2x==LNuSFftB1r8cyJ6TOqOVJfExMTUVxKZnS16wL4B8eBA@mail.gmail.com>
	<509FB25F.3030307@gmail.com>
	<CAKohpoksQ4ShO_QFAQORO2_oEgNtOeENFnX1C3gN_5POQSGexg@mail.gmail.com>
	<509FFF8B.3010707@gmail.com>
	<CAKohponUFABC397w=dq7j+1f5QeiOX4BCOXv=OZSNOaOTmt9oQ@mail.gmail.com>
	<CAKohponUt4264UaxM2Wr41=fbPJkUCFhKhOapjPQC=OYDuyMbQ@mail.gmail.com>
	<CAB4BAks+eym9+qNZjxwkg7XxJrMwkaYFWGM5_YQk_TzfxyoHaw@mail.gmail.com>
	<CAKohpo=U2xss6cZMBKsbLJ4G-AWeEnHz8V-HFw2NKx0fucTK8Q@mail.gmail.com>
	<CAB4BAktsPviZ11QjSGgdzaV0uvLq3TLk4au6=dOgv7NtA9nc4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAB4BAktsPviZ11QjSGgdzaV0uvLq3TLk4au6=dOgv7NtA9nc4Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajanikanth HV <rajanikanth.hv@linaro.org>
Cc: Rob Herring <robherring2@gmail.com>, "linaro-dev@lists.linaro.org Devel" <linaro-dev@lists.linaro.org>, andriy.shevchenko@intel.com, Patch Tracking <patches@linaro.org>, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 19 November 2012 12:05, Rajanikanth HV <rajanikanth.hv@linaro.org> wrote:
> On 19 November 2012 12:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> Firstly you tried square braces [ ], I am not sure if that is allowed.
>> Can you point me to the specification?
> http://www.devicetree.org/Device_Tree_Usage
> "
> a-byte-data-property = [0x01 0x23 0x34 0x56];
> "

Ok, but what about 16 bit then {} :)
