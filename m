From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCHv4 4/7] hwspinlock/core: add common OF helpers
Date: Fri, 26 Sep 2014 07:40:33 -0700
Message-ID: <CAJAp7Oj-3ZxvN8o=rg8YeTiXYWyQ1iowgisdU1R5UcZeh4VmOQ@mail.gmail.com>
References: <1389658764-39199-1-git-send-email-s-anna@ti.com>
	<1389658764-39199-5-git-send-email-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1389658764-39199-5-git-send-email-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 4:19 PM, Suman Anna <s-anna@ti.com> wrote:
> This patch adds three new OF helper functions to use/request
> locks from a hwspinlock device instantiated through a
> device-tree blob.
>

Hi Ohad, Suman

I'm about to send out some patches that depends on this functionality,
how do we move forward?

I still think it's wrong to not return -EPROBE_DEFER, but I much
rather have the code returning NULL than not having it in the tree (we
can always argue about it later...).

@Suman, do you remember if there was any other comments on the patch?

@Ohad, do you object merging Suman's patch in it's current form? I
think it should still apply cleanly.

Regards,
Bjorn
