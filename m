From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 12/13] ARM: STi: DT: STiH410: Add STiH410 SoC clock support.
Date: Fri, 07 Nov 2014 13:13:36 +0100
Message-ID: <88469624.TsXJ3Gpfe2@wuerfel>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org> <1415361475-6218-13-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415361475-6218-13-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

On Friday 07 November 2014 11:57:54 Peter Griffin wrote:
> +
> +       soc {
> +
> +               ohci0: usb@9a03c00 {
> +                       status = "okay";
> +               };
> +
> +               ehci0: usb@9a03e00 {
> +                       status = "okay";
> +               };
> +
> +               ohci1: usb@9a83c00 {
> +                       status = "okay";
> +               };
> +
> +               ehci1: usb@9a83e00 {
> +                       status = "okay";
> +               };
> +       };
> +};
> 

These seem to refer to an existing device in the base dtsi file. Just put the label
in the shared file and remove the exact names here. Alternatively, drop the labels
you don't use.

	Arnd
