From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 7/8] Remove fdtdump and use fdtgrep instead
Date: Wed, 6 Feb 2013 08:40:27 -0800
Message-ID: <CAPnjgZ1VvTV44Vmudn974ko0XpC=me=9XYvpqkdQtY_H6Vg7jA@mail.gmail.com>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
 <1358801962-21707-8-git-send-email-sjg@chromium.org>
 <20130206071606.GR821@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130206071606.GR821-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Tue, Feb 5, 2013 at 11:16 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Jan 21, 2013 at 12:59:21PM -0800, Simon Glass wrote:
>> Since fdtgrep does everything that fdtdump does now, perhaps we should
>> replace it with a symlink.
>
> Nack.  The point of fdtdump is not simply to be a tool for dumping
> device trees - dtc -I dtb -O dts will do that already.  The point is
> to be a really simple, independent implementation of dumping the tree,
> which can be used for analyzing bugs in the more complex tools.

Sounds reasonable - I wasn't aware of that. I figured that if I didn't
send a patch to implement dump with grep then someone would ask for
it... But I agree it is nice to keep the simple code and I have made
the output function common anyway.

Regards,
Simon

>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
