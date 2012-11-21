From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 00/14] ARM: SPEAr: DT updates
Date: Wed, 21 Nov 2012 12:24:05 -0800
Message-ID: <20121121202405.GA15549@quad.lixom.net>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
 <201211121521.58766.arnd@arndb.de>
 <CAKohpom0kMjuHx5jO-LTPKQhy_-r4khKi7UBPB_O-50K42FOeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKohpom0kMjuHx5jO-LTPKQhy_-r4khKi7UBPB_O-50K42FOeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2012 at 10:48:16PM +0530, Viresh Kumar wrote:
> On 12 November 2012 20:51, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Sunday 11 November 2012, Viresh Kumar wrote:
> 
> > I tried pulling in patches 2 to 11, but it no longer builds because of the
> > dependency you mentioned. Can you be more specific which branch I need
> > to pull in?
> 
> pinctrl/for-next

for-next is LinusW's unstable branch. If the patches have moved over into
his /devel branch we can normally pull them in as a dependency though. Do
you happen to know which patches we need for this in particular, i.e. at
what point we need to pull in the branch? I don't want to have to search
for it if I can avoid and we try to pull in minimal dependencies if
we can, instead of all his staged code.

We're also running out of time for 3.8 staging, but if you're able to
figure out the above I'll make an attempt to apply the patches from above.


-Olof
