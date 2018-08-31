From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] ARM: dts: pxa: add mioa701 board description
Date: Fri, 31 Aug 2018 16:54:37 +0200
Message-ID: <878t4m7fiq.fsf@belgarion.home>
References: <20180830195941.6118-1-robert.jarzmik@free.fr>
        <201808311515.Fq0HyEql%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201808311515.Fq0HyEql%fengguang.wu@intel.com> (kbuild test
        robot's message of "Fri, 31 Aug 2018 15:45:18 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

kbuild test robot <lkp@intel.com> writes:

> Hi Robert,
>
> I love your patch! Yet something to improve:
This is because you are missing at least this patch submitted earlier :
 - [PATCH] ARM: dts: pxa: add pincontrol helpers

You're also missing the previous patches in the pxa/dt tree, which are already
on the trampoline for linux-next :
 - git fetch github.com:rjarzmik/linux.git pxa/dt

Cheers.

--
Robert
