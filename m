From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH V2 2/2] Input: spear-keyboard: add device tree bindings
Date: Tue, 27 Mar 2012 00:13:35 -0700
Message-ID: <20120327071335.GB1521@core.coreip.homeip.net>
References: <4aba6f2cd9f050f419660555bdb661915c1be9b1.1332826100.git.viresh.kumar@st.com>
 <c7944fdbb1dca61840d33c6b96fde484b1527bfc.1332826100.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c7944fdbb1dca61840d33c6b96fde484b1527bfc.1332826100.git.viresh.kumar@st.com>
Sender: linux-input-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@st.com>
Cc: swarren@nvidia.com, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-input@vger.kernel.org, spear-devel@list.st.com, viresh.linux@gmail.com, sr@denx.de
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Tue, Mar 27, 2012 at 11:08:12AM +0530, Viresh Kumar wrote:
> +	if (np) {
> +		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata) {
> +			dev_err(&pdev->dev, "DT: kzalloc failed\n");
> +			return -ENOMEM;
> +		}
> +
> +		pdev->dev.platform_data = pdata;
> +		error = spear_kbd_probe_dt(pdev);
> +		if (error) {
> +			dev_err(&pdev->dev, "DT: no platform data\n");
> +			return error;
> +		}
> +	} else {
> +		pdata = dev_get_platdata(&pdev->dev);
> +		if (!pdata || !pdata->keymap) {
> +			dev_err(&pdev->dev, "Invalid platform data\n");
> +			return -EINVAL;
> +		}
>  	}

I think the opposite order woudl make more sense - if pdata is supplied
by the platform code then we should use it, otherwise try to see if
there is OF data available instead. This way one can easily override OF
data, if needed.

Same goes for keymap data.

Thanks.

-- 
Dmitry
