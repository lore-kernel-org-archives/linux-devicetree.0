From: Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] iio: light: Updated Vishay Capella cm32181 ambient
 light sensor driver. - Renamed company name. - Removed cm32181_reg. - Removed
 white space. - Removed unused include files. - Updated macro definitions. -
 Renamed cm32181_chip pointer to chip.
Date: Fri, 22 May 2015 09:57:12 +0300
Message-ID: <CAEnQRZBxX-YxU1u8PuE_8ApBpsEOU9XenFyhbKUbmTW4RzO+=w@mail.gmail.com>
References: <1432254645-5349-1-git-send-email-ktsai@capellamicro.com>
	<20150522015615.GA3320@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150522015615.GA3320-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <l>
List-Id: devicetree@vger.kernel.org

On Fri, May 22, 2015 at 4:56 AM, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Thu, May 21, 2015 at 05:30:40PM -0700, Kevin Tsai wrote:
>> Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
>> ---
>
> Your whole changelog ended up in the Subject line :(

Hi Kevin,

Few comments:

1) Please also add a cover letter. Use --cover-letter parameter of git
format-patch.
2) Please create a patch for each logical change. Your current 1/6
patch should be
split in several small patches:
 * 1/6 iio: light: cm32181: Update company name
 * 2/6 iio: light: cm32181: Remove unused include files
 * etc.
3) Please use specific wordings for commit subject. A subject like this:

"Updated Vishay Capella cm32181 ambient light sensor driver" doesn't say much.

thanks,
Daniel.
