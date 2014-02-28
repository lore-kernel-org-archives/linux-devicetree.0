From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v3] hwspinlock/msm: Add support for Qualcomm MSM HW Mutex block
Date: Thu, 27 Feb 2014 21:52:43 -0800
Message-ID: <CAJAp7OhBxJme7BRMJL3G3ookES7=QOvQSakgHGkThU=Ykwx8+A@mail.gmail.com>
References: <1376507361-26907-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376507361-26907-1-git-send-email-galak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Kumar,

I pulled this in to my 3.14 tree and gave it a spin. But I keep
hitting the case of unlock below telling me that someone else is
holding the lock.

On Wed, Aug 14, 2013 at 12:09 PM, Kumar Gala <galak@codeaurora.org> wrote:
[...]
> +
> +static int msm_hwspinlock_trylock(struct hwspinlock *lock)
> +{
> +       void __iomem *lock_addr = lock->priv;
> +
> +       writel_relaxed(SPINLOCK_ID_APPS_PROC, lock_addr);

You need some sort of barrier here; the caf code have a smp_mb() here,
inserting that solves the problem.

> +
> +       return readl_relaxed(lock_addr) == SPINLOCK_ID_APPS_PROC;
> +}
> +
> +static void msm_hwspinlock_unlock(struct hwspinlock *lock)
> +{
> +       u32 lock_owner;
> +       void __iomem *lock_addr = lock->priv;
> +
> +       lock_owner = readl_relaxed(lock_addr);
> +       if (lock_owner != SPINLOCK_ID_APPS_PROC) {
> +               pr_err("%s: spinlock not owned by us (actual owner is %d)\n",
> +                               __func__, lock_owner);
> +       }
> +
> +       writel_relaxed(0, lock_addr);
> +}
> +

Part of this I think this driver looks good, it would be nice to get
the last details cleaned up so we could get it into the tree.

Regards,
Bjorn
