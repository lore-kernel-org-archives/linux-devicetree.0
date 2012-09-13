From: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v4 0/5] ARM: topology: set the capacity of each cores
	for big.LITTLE
Date: Thu, 13 Sep 2012 14:07:11 +0200
Message-ID: <1347538031.15764.126.camel@twins>
References: <1341826026-6504-1-git-send-email-vincent.guittot@linaro.org>
	<1341919622.3462.124.camel@twins>
	<CAKfTPtC0BcidJ2ga9c2fdWjrEsfXH48QtSnjv0YOCv7-k3K-Ug@mail.gmail.com>
	<1341927729.3462.131.camel@twins>
	<CAKfTPtCpZS=ALAjwqX5Wb0j5HjrMjv87MEefGC2O5_p7ENeY2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <CAKfTPtCpZS=ALAjwqX5Wb0j5HjrMjv87MEefGC2O5_p7ENeY2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yong.zhang0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2012-09-13 at 11:17 +0200, Vincent Guittot wrote:
> On 10 July 2012 15:42, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org> wrote:
> > On Tue, 2012-07-10 at 14:35 +0200, Vincent Guittot wrote:
> >>
> >> May be the last one which enable ARCH_POWER should also go into tip ?
> >>
> > OK, I can take it.
> 
> Hi Peter,
> 
> I can't find the patch that enable ARCH_POWER in the tip tree. Have
> you take it in your tree ?


Uhmmm.... how about I say I have now? Sorry about that.
