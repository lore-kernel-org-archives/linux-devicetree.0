From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dt: document NXP LPC1850 DAC driver bindings
Date: Sat, 12 Mar 2016 20:06:59 +0100
Message-ID: <CAGhQ9Vwys4G_pDWWDObDXVs0fTHkNr6v7aNWDZJue89GY+UV6w@mail.gmail.com>
References: <1457785817-32328-1-git-send-email-manabian@gmail.com>
	<1457785817-32328-5-git-send-email-manabian@gmail.com>
	<56E45D45.4050605@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E45D45.4050605-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On 12 March 2016 at 19:17, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 12/03/16 12:30, Joachim Eastwood wrote:
>> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> A very straight forward binding so I'm happy to apply this without
> a devicetree ack (still time if anyone does want to take a look though as
> it won't be in my non rebasing tree until probably next weekend now.)
>
> Applied to the togreg branch of iio.git - initially pushed out as testing
> for the autobuilders to play with it.

Thanks!

> We have unfortunately missed the merge window that will probably open tomorrow
> (as IIO stuff must be in a few weeks before that) so this is looking at the
> next merge window in 3 months time.  Will be in linux-next in about 3-4 weeks
> though after I send a pull request to Greg KH post merge window closing.
I wasn't expecting it to go upstream in the upcoming window. But I
will be good to get it into next after the window closes so I can get
the DT bits for lpc18xx upstream as well.


regards,
Joachim Eastwood
