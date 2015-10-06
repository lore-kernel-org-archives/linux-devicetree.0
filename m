From: Andrew <andrew@ncrmnt.org>
Subject: Re: [RFC][PATCH 2/2] staging: ion: Add files for parsing the
 devicetree (WIP)
Date: Wed, 07 Oct 2015 00:30:11 +0300
Message-ID: <4336b2d38b1f92a5dddf979e63954470@mail.ncrmnt.org>
References: <1444164433-9107-1-git-send-email-labbott@fedoraproject.org>
 <1444164433-9107-3-git-send-email-labbott@fedoraproject.org>
Reply-To: andrew@ncrmnt.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444164433-9107-3-git-send-email-labbott@fedoraproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laura Abbott <labbott@fedoraproject.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, arve@android.com, Riley Andrews <riandrews@android.com>, Laura Abbott <laura@labbott.name>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Gall <tom.gall@linaro.org>, Colin Cross <ccross@google.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, romlem@google.com, mitchelh@codeaurora.org, linux-arm-kernel@lists.infradead.org, Feng Tang <feng.tang@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Thanks a lot for starting again with dt bindings discussion.
I got carried away by work and never had a chance for a respin of my 
ion-physmem.

I'll try to test these on actual hardware next week and provide more 
detailed
feedback. For now just a small pick:

> -
> +obj-$(CONFIG_ION_DUMMY)   += ion_dummy_driver.o
> +obj-$(CONFIG_ION_PHYSMEM) += ion_physmem.o
> +obj-$(CONFIG_ION_TEGRA)   += tegra/
> +obj-$(CONFIG_ION_OF) +=	ion_of.o ion_physmem.o

ion_physmem.o looks like the one that shouldn't be here, right?

P.S. Anyone interested in a non-android port of libion with
a few helper utils? I had to call it liblinuxion, since libion is 
something
already present in repositories.

-- 
Regards,
Andrew
RC Module
