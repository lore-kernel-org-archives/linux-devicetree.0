From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V2 2/3] dt-bindings: document common IEEE 802.11
 frequency limit property
Date: Mon, 02 Jan 2017 14:49:10 +0100
Message-ID: <1483364950.21014.4.camel@sipsolutions.net>
References: <20170102132747.3491-1-zajec5@gmail.com>
         <20170102132747.3491-2-zajec5@gmail.com>
         (sfid-20170102_142833_051848_62BC2D8C)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170102132747.3491-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (sfid-20170102_142833_051848_62BC2D8C)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> +pcie@0,0 {
> +	reg = <0x0000 0 0 0 0>;
> +	wifi@0,0 {
> +		reg = <0x0000 0 0 0 0>;
> +		ieee80211-freq-limit = <2402000 2432000>,
> +				       <2432000 2462000>;
> +	};
> +};

Syntactically, that might be a good example, but semantically it
doesn't really make sense to have those ranges that have a common
endpoint?

johannes
