From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Question: Does devicetree capable of describing pinmux?
Date: Wed, 11 Apr 2012 09:37:36 -0600
Message-ID: <4F85A540.7050101@wwwdotorg.org>
References: <CAF1ZMEeRuF=VnRys9FbeWBmp-AAeZMfxpYhydNaJ4e9_ffjVrA@mail.gmail.com>
 <CAF1ZMEd+EA48oL_2BHqNEU29dzKzRE7D7GHSjakqvn4Yj9kzkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAF1ZMEd+EA48oL_2BHqNEU29dzKzRE7D7GHSjakqvn4Yj9kzkQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Dennis.Yxun" <dennis.yxun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Wed, Apr 11, 2012 at 5:35 PM, Dennis.Yxun <dennis.yxun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> <mailto:dennis.yxun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
> 
>     Hi Fork:
>        I would like to know whether device tree capable of describing
>     pinmux?
...
On 04/11/2012 03:42 AM, Dennis.Yxun wrote:
> Possibly that can be connected to pinctrl subsystem, right?

Yes, the pinctrl subsystem recently grew support for representing pinmux
in the device tree. See for example:

repo git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
branch for-next
path Documentation/devicetree/bindings/pinctrl/
