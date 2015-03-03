From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Input: bcm-keypad: add device tree bindings
Date: Mon, 2 Mar 2015 16:04:18 -0800
Message-ID: <20150303000418.GA30787@dtor-ws>
References: <sbranden@broadcom.com>
 <1425141357-7807-1-git-send-email-sbranden@broadcom.com>
 <1425141357-7807-2-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425141357-7807-2-git-send-email-sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 28, 2015 at 08:35:56AM -0800, Scott Branden wrote:
> Documents the Broadcom keypad controller device tree bindings.
> 
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

I folded this into the patch adding the driver itself and queued for
4.1.

Thank you.

> ---
>  .../devicetree/bindings/input/brcm,bcm-keypad.txt  | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
> new file mode 100644
> index 0000000..b77f50b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
> @@ -0,0 +1,108 @@
> +* Broadcom Keypad Controller device tree bindings
> +
> +Broadcom Keypad controller is used to interface a SoC with a matrix-type
> +keypad device. The keypad controller supports multiple row and column lines.
> +A key can be placed at each intersection of a unique row and a unique column.
> +The keypad controller can sense a key-press and key-release and report the
> +event using a interrupt to the cpu.
> +
> +This binding is based on the matrix-keymap binding with the following
> +changes:
> +
> +keypad,num-rows and keypad,num-columns are required.
> +
> +Required SoC Specific Properties:
> +- compatible: should be "brcm,bcm-keypad"
> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +- interrupts: The interrupt number to the cpu.
> +
> +Board Specific Properties:
> +- keypad,num-rows: Number of row lines connected to the keypad
> +  controller.
> +
> +- keypad,num-columns: Number of column lines connected to the
> +  keypad controller.
> +
> +- col-debounce-filter-period: The debounce period for the Column filter.
> +
> +	KEYPAD_DEBOUNCE_1_ms	=	0
> +	KEYPAD_DEBOUNCE_2_ms	=	1
> +	KEYPAD_DEBOUNCE_4_ms	=	2
> +	KEYPAD_DEBOUNCE_8_ms	=	3
> +	KEYPAD_DEBOUNCE_16_ms	=	4
> +	KEYPAD_DEBOUNCE_32_ms	=	5
> +	KEYPAD_DEBOUNCE_64_ms	=	6
> +	KEYPAD_DEBOUNCE_128_ms	=	7
> +
> +- status-debounce-filter-period: The debounce period for the Status filter.
> +
> +	KEYPAD_DEBOUNCE_1_ms	=	0
> +	KEYPAD_DEBOUNCE_2_ms	=	1
> +	KEYPAD_DEBOUNCE_4_ms	=	2
> +	KEYPAD_DEBOUNCE_8_ms	=	3
> +	KEYPAD_DEBOUNCE_16_ms	=	4
> +	KEYPAD_DEBOUNCE_32_ms	=	5
> +	KEYPAD_DEBOUNCE_64_ms	=	6
> +	KEYPAD_DEBOUNCE_128_ms	=	7
> +
> +- row-output-enabled: An optional property indicating whether the row or
> +  column is being used as output. If specified the row is being used
> +  as the output. Else defaults to column.
> +
> +- pull-up-enabled: An optional property indicating the Keypad scan mode.
> +  If specified implies the keypad scan pull-up has been enabled.
> +
> +- autorepeat: Boolean, Enable auto repeat feature of Linux input
> +	  subsystem (optional).
> +
> +- linux,keymap: The keymap for keys as described in the binding document
> +  devicetree/bindings/input/matrix-keymap.txt.
> +
> +Example:
> +#include "dt-bindings/input/input.h"
> +
> +/ {
> +	keypad: keypad@180ac000 {
> +		/* Required SoC specific properties */
> +		compatible = "brcm,bcm-keypad";
> +
> +		/* Required Board specific properties */
> +		keypad,num-rows = <5>;
> +		keypad,num-columns = <5>;
> +		status = "okay";
> +
> +		linux,keymap = <MATRIX_KEY(0x00, 0x02, KEY_F) /* key_forward */
> +		MATRIX_KEY(0x00, 0x03, KEY_HOME) /* key_home */
> +		MATRIX_KEY(0x00, 0x04, KEY_M) /* key_message */
> +		MATRIX_KEY(0x01, 0x00, KEY_A) /* key_contacts */
> +		MATRIX_KEY(0x01, 0x01, KEY_1) /* key_1 */
> +		MATRIX_KEY(0x01, 0x02, KEY_2) /* key_2 */
> +		MATRIX_KEY(0x01, 0x03, KEY_3) /* key_3 */
> +		MATRIX_KEY(0x01, 0x04, KEY_S) /* key_speaker */
> +		MATRIX_KEY(0x02, 0x00, KEY_P) /* key_phone */
> +		MATRIX_KEY(0x02, 0x01, KEY_4) /* key_4 */
> +		MATRIX_KEY(0x02, 0x02, KEY_5) /* key_5 */
> +		MATRIX_KEY(0x02, 0x03, KEY_6) /* key_6 */
> +		MATRIX_KEY(0x02, 0x04, KEY_VOLUMEUP) /* key_vol_up */
> +		MATRIX_KEY(0x03, 0x00, KEY_C) /* key_call_log */
> +		MATRIX_KEY(0x03, 0x01, KEY_7) /* key_7 */
> +		MATRIX_KEY(0x03, 0x02, KEY_8) /* key_8 */
> +		MATRIX_KEY(0x03, 0x03, KEY_9) /* key_9 */
> +		MATRIX_KEY(0x03, 0x04, KEY_VOLUMEDOWN) /* key_vol_down */
> +		MATRIX_KEY(0x04, 0x00, KEY_H) /* key_headset */
> +		MATRIX_KEY(0x04, 0x01, KEY_KPASTERISK) /* key_* */
> +		MATRIX_KEY(0x04, 0x02, KEY_0) /* key_0 */
> +		MATRIX_KEY(0x04, 0x03, KEY_GRAVE) /* key_# */
> +		MATRIX_KEY(0x04, 0x04, KEY_MUTE) /* key_mute */
> +		>;
> +
> +		/* Optional board specific properties */
> +		col-debounce-filter-period = <5>;
> +		row-output-enabled;
> +		pull-up-enabled;
> +
> +	};
> +};
> -- 
> 2.3.0
> 

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
