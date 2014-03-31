From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v3 1/2] NFC: pn544_i2c: Add device-tree (Open
 Firmware) support to PN544
Date: Tue, 1 Apr 2014 01:48:59 +0200
Message-ID: <20140331234859.GA1152@zurbaran>
References: <92d1a06e7bda4a46a0b6a28ba6ede55b@AMXPR04MB136.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <92d1a06e7bda4a46a0b6a28ba6ede55b-fjMGVQzTDdguRZvghep3ngfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Clement,

One more comment:

On Mon, Mar 31, 2014 at 12:21:44PM +0000, Clement Perrochaud wrote:
> +	/* No platform data, using device tree. */
> +	if (!pdata && client->dev.of_node) {
> +		r = pn544_hci_i2c_of_request_resources(client);
> +		if (r) {
> +			nfc_err(&client->dev, "No DT data\n");
> +			return r;
> +		}
> +	/* Using platform data. */
> +	} else {
That should be: } else if (pdata) {
as you need to check for pdata before dereferencing it.
And your final else will handle the error case where both pdata and of_node
are NULL.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
