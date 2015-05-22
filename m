From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/6] iio: light: Updated Vishay Capella cm32181 ambient
 light sensor driver. - Renamed company name. - Removed cm32181_reg. -
 Removed white space. - Removed unused include files. - Updated macro
 definitions. - Renamed cm32181_chip pointer to chip.
Date: Thu, 21 May 2015 18:56:15 -0700
Message-ID: <20150522015615.GA3320@kroah.com>
References: <1432254645-5349-1-git-send-email-ktsai@capellamicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432254645-5349-1-git-send-email-ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 05:30:40PM -0700, Kevin Tsai wrote:
> Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> ---

Your whole changelog ended up in the Subject line :(
