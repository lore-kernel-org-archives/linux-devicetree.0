From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] of: define struct device in of_platform.h if !OF_DEVICE
 and !OF_ADDRESS
Date: Wed, 19 Dec 2012 16:37:54 +0100
Message-ID: <CAOiHx=nd0FjpnA-H_QfCPEJSecSwaTB5+eDarb2DKx2+G=ZnMA@mail.gmail.com>
References: <1355578062-21876-1-git-send-email-jogo@openwrt.org>
 <50D1D97B.1020309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50D1D97B.1020309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 19 December 2012 16:12, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/15/2012 07:27 AM, Jonas Gorski wrote:
>> Fixes the following warning:
>>
>> include/linux/of_platform.h:106:13: warning: 'struct device' declared inside parameter list [enabled by default]
>> include/linux/of_platform.h:106:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
>>
>> Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> ---
>
> It seems like this never made it to the list, so hopefully this reply will.
>
> Rob

It's in the archive, and I received it from the list (on a different
email account), so it whatever made it not there must be a local
issue:

<https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-December/024480.html>

Regards
Jonas
