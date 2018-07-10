From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] mhi_bus: core: add support for data transfer
Date: Tue, 10 Jul 2018 08:29:07 +0200
Message-ID: <20180710062907.GB892@kroah.com>
References: <1524795811-21399-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-4-git-send-email-sdias@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531166894-30984-4-git-send-email-sdias@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sujeev Dias <sdias@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Tony Truong <truong@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 01:08:10PM -0700, Sujeev Dias wrote:
> +static void mhi_add_ring_element(struct mhi_controller *mhi_cntrl,
> +				 struct mhi_ring *ring)
> +{
> +	ring->wp += ring->el_size;
> +	if (ring->wp >= (ring->base + ring->len))
> +		ring->wp = ring->base;
> +	/* smp update */
> +	smp_wmb();

Why do this?  You need to comment the heck out of odd stuff like this.

Also, why are you using your own ring buffer code?  What's wrong with
the code that is in the kernel already for this type of thing?

thanks,

greg k-h
