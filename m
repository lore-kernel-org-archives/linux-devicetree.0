From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] Documentation: arm: define DT bindings for system
 suspend
Date: Thu, 05 Feb 2015 13:28:32 +0000
Message-ID: <54D37000.8000006@arm.com>
References: <1421840155-18990-1-git-send-email-sudeep.holla@arm.com> <1421840155-18990-2-git-send-email-sudeep.holla@arm.com> <20150204161006.GD6592@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150204161006.GD6592@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Amit Daniel Kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 04/02/15 16:10, Mark Rutland wrote:
> Hi Sudeep,
>
> On Wed, Jan 21, 2015 at 11:35:54AM +0000, Sudeep Holla wrote:
>> ARM based platforms implement unique ways to enter system suspend
>> (i.e. Suspend to RAM). The mechanism and the parameters defining the
>> system state vary on a per-platform basis forcing the OS to handle it
>> in very platform specific way.
>>
>> Since ARM 32-bit systems had machine specific code, no attempts to
>> standardize are being made as it provides easy way to implement suspend
>> operations in a platform specific manner. However, this approach not
>> only makes maintainance more difficult as the number of platforms
>> supported increases but also not feasible for ARM64.
>>
>> This DT binding aims at standardizing the system suspend for ARM
>> platforms. ARM64 platforms mandates entry-method property in DT for
>> this system suspend node.
>>
>> On system implementing PSCI as an enable-method to enter system suspend,
>> the PSCI CPU suspend method is used on versions upto v0.2 and requires
>> the power_state parameter to be passed to the PSCI CPU suspend function.
>>
>> This parameter is platform specific, therefore must be provided by
>> firmware to the OS in order to enable proper call sequence.
>>
>> This ARM system suspend DT bindings rely on a property
>> (i.e. arm,psci-suspend-param) in the PSCI DT bindings that describes
>> how the PSCI CPU suspend power_state parameter should be defined in DT.
>
> A short while ago (after this posting), the PSCI 1.0 spec [1] was
> released, featuring the new (optional) SYSTEM_SUSPEND mechanism intended
> for suspend to RAM. This has a standard ID, and its presence can be
> detected via the new standard PSCI_FEATURES call.
>
> The fundamental mechanism is identical. We would hot unplug all but one
> CPU, and from this remaining CPU we would make a SYSTEM_SUSPEND call.
> The major differences are that SYSTEM_SUSPEND can be detected via
> PSCI_FEATURES, and doesn't need a state parameter.
>
> Given that the only mandatory addition in PSCI 1.0 over PSCI 0.2 is the
> PSCI_FEATURES call (used to detect the presence of SYSTEM_SUSPEND), I do
> not believe that implementing this should be a signficant overhead
> compared to implementing the CPU_SUSPEND based approach with PSCI 0.2.
>
> So I'd very much prefer that we require a minimal PSCI 1.0 with
> SYSTEM_SUSPEND rather than extending CPU_SUSPEND in this manner. Is
> anyone attempting to implement suspend to RAM with PSCI 0.1?
>

I too prefer have PSCI v1.0 for SYSTEM SUSPEND support, which eliminates
the need for this binding. But the question is: are silicon vendors
ready to upgrade their firmware to PSCI v1.0 for system system feature
especially since it's one of the fundamental feature needed in Android
systems.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
