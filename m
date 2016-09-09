From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] hwmon: xgene: access mailbox as RAM
Date: Fri, 09 Sep 2016 22:50:43 +0200
Message-ID: <6198994.YhDCC7xNAM@wuerfel>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <2852054.37zytD0HIa@wuerfel> <CAFHUOYyGf0MFtDrYaAMSRjZ5hJ4yxV6wSa3BpGF73tyC6GQBxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFHUOYyGf0MFtDrYaAMSRjZ5hJ4yxV6wSa3BpGF73tyC6GQBxw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, September 9, 2016 1:43:17 PM CEST Hoan Tran wrote:
> 
> > * Are you sure you don't need any smp_rmb()/smp_wmb() barriers
> > between the accesses?
> 
> No, we don't need a strict read/write during access PCC subspace. Just
> make sure all access is committed before PCC send message to the
> platform which done by PCC mailbox driver.
> 

Ok, got it. The PCC mailbox driver presumably uses writel() to
send the message, and that implies the necessary barrier
(unlike writel_relaxed), right?

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
