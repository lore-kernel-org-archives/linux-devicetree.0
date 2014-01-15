From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3] ARM: dts: imx6sl: add keypad support for i.mx6sl-evk
 board.
Date: Wed, 15 Jan 2014 13:56:45 +0800
Message-ID: <20140115055643.GE1896@S2101-09.ap.freescale.net>
References: <1389691828-27000-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389691828-27000-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 14, 2014 at 05:30:28PM +0800, Anson Huang wrote:
> i.MX6SL EVK board has a 3*3 keypad matrix to support 8 keypads,
> enable them, the keymap is as below:
> 
> SW6:  MATRIX_KEY(0x0, 0x0, KEY_UP)         /* ROW0, COL0 */
> SW7:  MATRIX_KEY(0x0, 0x1, KEY_DOWN)       /* ROW0, COL1 */
> SW8:  MATRIX_KEY(0x0, 0x2, KEY_ENTER)      /* ROW0, COL2 */
> SW9:  MATRIX_KEY(0x1, 0x0, KEY_HOME)       /* ROW1, COL0 */
> SW10: MATRIX_KEY(0x1, 0x1, KEY_RIGHT)      /* ROW1, COL1 */
> SW11: MATRIX_KEY(0x1, 0x2, KEY_LEFT)       /* ROW1, COL2 */
> SW12: MATRIX_KEY(0x2, 0x0, KEY_VOLUMEDOWN) /* ROW2, COL0 */
> SW13: MATRIX_KEY(0x2, 0x1, KEY_VOLUMEUP)   /* ROW2, COL1 */
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied, thanks.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
