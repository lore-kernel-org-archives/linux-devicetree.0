From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 4/6] rtc: pm8xxx: add support for devicetree
Date: Mon, 10 Mar 2014 13:47:48 -0700
Message-ID: <20140310134748.dae1b77cfac3df68bd2c1d69@linux-foundation.org>
References: <1394477089-3996-1-git-send-email-joshc@codeaurora.org>
	<1394477089-3996-5-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394477089-3996-5-git-send-email-joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, rtc-linux@googlegroups.com, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Mar 2014 13:44:47 -0500 Josh Cartwright <joshc@codeaurora.org> wrote:

> Add support for describing the PM8921/PM8058 RTC in device tree.
> 
> Additionally:
>    - drop support for describing the RTC using platform data,
>      as there are no current in tree users who do so.
>    - make allow_set_time a device-specific flag, instead of mucking
>      with the rtc_ops

Is this tested with and without CONFIG_OF?
