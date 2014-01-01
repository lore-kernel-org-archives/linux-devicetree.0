From: Jonathan <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/1] iio: add Capella CM32181 ambient light sensor
 driver.
Date: Wed, 01 Jan 2014 12:05:54 +0000
Message-ID: <52C404A2.9030106@kernel.org>
References: <1387850035-4030-1-git-send-email-ktsai@capellamicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387850035-4030-1-git-send-email-ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Huewe <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Teddy Reed <teddy-KaFzXBG2u9Ng9hUCZPvPmw@public.gmane.org>, Kent Yoder <key-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 24/12/13 01:53, Kevin Tsai wrote:
> Add Capella Microsystem CM32181 Ambient Light Sensor IIO driver.
> This driver will convert raw data to lux value under open-air
> condition. Change the calibscale based on the cover material.
>
> Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> ---
Hi Kevin,

It is good practice to list here (nothing from here goes in final commit
message) any changes since the previous version.  This just makes it clear
whether you have responded to all review comments, particularly when there
are multiple people reviewing the patch.


Other than that, I'm happy with this and have applied it to the togreg 
branch of iio.git - initially pushed out as testing for build tests.

Note I made one tiny white space change (dropped a blank line where 
there were two...
