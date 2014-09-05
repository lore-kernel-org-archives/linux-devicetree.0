From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v5 1/5] usb: host: ehci-st: Add EHCI support for ST STB devices
Date: Fri, 05 Sep 2014 19:57:28 +0200
Message-ID: <202755915.brE74x99uQ@wuerfel>
References: <1409937829-23708-1-git-send-email-peter.griffin@linaro.org> <1409937829-23708-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409937829-23708-2-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, lee.jones@linaro.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 05 September 2014 18:23:45 Peter Griffin wrote:
> +struct st_platform_priv {
> +       struct clk *clks[USB_MAX_CLKS];
> +       struct clk *clk48;
> +       struct reset_control *rst;
> +       struct reset_control *pwr;
> +       struct phy *phy;
> +};

Any reason why this is in a shared header file? It looks like
duplicating the structure under two different names would
actually be shorter and keep the drivers more readable as they'd
be self-contained, even when they have the exact same structure.

Do both drivers use all fields?

	Arnd
