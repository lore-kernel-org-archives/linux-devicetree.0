From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Status variable
Date: Fri, 29 Jan 2016 10:18:52 +0100
Message-ID: <1530624.RRYs7rau87@wuerfel>
References: <CANMsd02jhaouPBuySWXQ2edE+gyMZ3dncobipKa-dg1vLJCE2Q@mail.gmail.com> <3706345.JqhHqFGYfF@wuerfel> <CANMsd01PnqUe+NVp-OGE3aMN=k1b4KX_D5YBnQAbPuHcT1+SWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANMsd01PnqUe+NVp-OGE3aMN=k1b4KX_D5YBnQAbPuHcT1+SWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan <ryanphilips19-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 29 January 2016 14:40:33 Ryan wrote:
> Hello Bergman,
> 
> Thanks for your help and time. Also I have seen that sometimes we use
> 
> i2c0: i2c@44e0b000 {
> 
> 
> }
> 
> and Sometimes
> 
> i2c@44e0b000
> 
> Why is that? What is the purpose of adding a i2c0: infront of the i2c
> entry. that too in the same file.

The "i2c0" is a label that can be used to reference the device as a
shortcut, so you don't have to write the entire path. If you
have a device with the full path "/soc/axi/ahb/i2c@44e0b000",
you can add the status="okay" propert by writing

/soc/axi/ahb/i2c@44e0b000 {
	status = "okay";
};

or you can do the shortcut and write

&i2c0 {
	status = "okay";
};

after you have defined the label. Some people prefer the latter
for brevity, others prefer an even more elaborate version by
always writing

/ {
	soc {
		axi {
			ahb {
				i2c0: i2c@44e0b000 {
					status = "okay";
				};
			};
		};
	};
};

which is the same thing as the above two again, but even duplicates
the label. I would recommend one of the first two approaches, and do
it consistently.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
