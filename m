From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv4 2/4] firmware: add Intel Stratix10 remote system update
 driver
Date: Tue, 28 May 2019 16:24:00 -0700
Message-ID: <20190528232400.GB29225@kroah.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 03:20:31PM -0500, richard.gong@linux.intel.com wrote:
> +static int rsu_send_msg(struct stratix10_rsu_priv *priv,
> +			enum stratix10_svc_command_code command,
> +	unsigned long arg,
> +	void (*callback)(struct stratix10_svc_client *client,
> +			 struct stratix10_svc_cb_data *data))

Odd indentation for arg, and then callback.

Why isn't callback a typedef to make this simpler to use?

thanks,

greg k-h
