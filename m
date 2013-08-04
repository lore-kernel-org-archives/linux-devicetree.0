From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: lps331ap: Add support for DT
Date: Sun, 04 Aug 2013 17:22:03 +0100
Message-ID: <51FE7FAB.8050608@kernel.org>
References: <1374240981-13560-1-git-send-email-j.anaszewski@samsung.com> <1374240981-13560-2-git-send-email-j.anaszewski@samsung.com> <51FE4117.3040404@kernel.org> <51FE4267.2090409@kernel.org> <20130804120854.GV2911@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130804120854.GV2911@lukather>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/04/13 13:08, Maxime Ripard wrote:
> Hi Jonathan,
> 
> On Sun, Aug 04, 2013 at 01:00:39PM +0100, Jonathan Cameron wrote:
>> On 08/04/13 12:55, Jonathan Cameron wrote:
>>> On 07/19/13 14:36, Jacek Anaszewski wrote:
>>>> This patch adds DT support for the lps331ap barometer sensor.
>>>> 
>>>> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> Signed-off-by: Kyungmin Park
>>>> <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> This makes sense to me and looks similar to that in existing bindings hence,
>>> 
>>> Applied to the togreg branch of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
>> Actually I've backed this change out as I've just read a few more emails down my backlog and found a long
>> discussion of it when it got pulled into another patch set.  Will review that discussion before making any
>> decisions on this one.
> 
> Also, a new process begin to emerge, and now, every new bindings should be acked by the new device tree
> maintainers. I'm not sure the discussion on the exact process has been settled, so that's probably why not all the
> maintainers are aware of that, but this ACK is (or will be) required for every new binding that comes in, and this
> should be enforced by all maintainers.
> 
> The underlying thinking is that DT bindings should be a stable ABI, and as such be properly reviewed, instead of
> just being looked at by the other maintainers that are often not interested or just don't really know about DT at
> all.
> 
> You can see parts of this discussion here: 
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-July/038275.html 
> https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-July/038264.html 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/186420.html
> 
Thanks for the heads up. I'd picked up on this a little via LWN. Hopefully
the process will become clear shortly.



Jonathan
