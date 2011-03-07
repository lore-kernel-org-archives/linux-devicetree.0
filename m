From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm/dt: add basic mx51 device tree support
Date: Mon, 7 Mar 2011 09:26:46 -0700
Message-ID: <AANLkTi=Xjip+q4myY_QYAbMyEO_wy8y6kCVENooYJmV+@mail.gmail.com>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<201103071537.49026.arnd@arndb.de>
	<20110307144621.GB9978@S2101-09.ap.freescale.net>
	<201103071552.26766.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201103071552.26766.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 7, 2011 at 7:52 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 07 March 2011, Shawn Guo wrote:
>> > Alternatively, it could be done the other way round: rename the identifiers
>> > in the file from mx51_ to mx5_, and make sure that they don't contain
>> > any mx51 specific settings but always refer to properties in the
>> > device tree for the differences.
>> >
>> So our ultimate goal is to have only one board-dt.c in one mach-xxx?
>
> I wouldn't make that a strict rule, but I'd say that one goal should be
> to have as few board-dt files as possible without adding complexity.
>
> As a start, we can say we want one file for per set of machines that
> can run a common binary kernel, but there may be good reasons for
> deviating from that rule on both sides.

+1, I completely agree.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
