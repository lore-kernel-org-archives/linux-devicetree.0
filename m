From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/6] iio: at91: introduce the multiple compatible string
 for different IPs.
Date: Thu, 29 Aug 2013 21:47:45 +0100
Message-ID: <521FB371.1030005@kernel.org>
References: <1377602932-1899-1-git-send-email-josh.wu@atmel.com> <1377602932-1899-3-git-send-email-josh.wu@atmel.com> <20130828080200.GM2695@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828080200.GM2695@lukather>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/28/13 09:02, Maxime Ripard wrote:
> Hi Josh,
> 
> On Tue, Aug 27, 2013 at 07:28:48PM +0800, Josh Wu wrote:
>> As use the multiple compatible string, we can remove hardware register in dt.
>> 
>> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> It's ok for me. You can add my Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
I've assumed for such and obviously good change that none of the devicetree
maintainers need to give an ack and applied this to the togreg branch of iio.git

Thanks,

Jonathan
> 
> Thanks! Maxime
> 
