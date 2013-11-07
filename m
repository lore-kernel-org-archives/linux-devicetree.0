From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] of: irq: Fix interrupt-map entry matching
Date: Thu, 7 Nov 2013 17:20:49 +0530
Message-ID: <CAK9yfHxgbyaucmJ34fj0bu-4amO4OPs-RjzBRQWcGDwTKDr=mA@mail.gmail.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	<20131104050455.GA3651@quad.lixom.net>
	<2177804.l4VGDTRFDu@amdc1227>
	<2713030.RoDxNQo0oz@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2713030.RoDxNQo0oz@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 November 2013 20:51, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch fixes interrupt-map entry matching code to properly match all
> specifier cells with interrupt map entries.
>
> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Tested on Origen and Arndale boards. Works fine.

Tested-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
