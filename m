From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: WARNING: drivers/built-in.o(.devinit.text+0xa9b48): Section
 mismatch in reference from the function bbc_i2c_probe() to the function
 .init.text:attach_one_i2c.constprop.1()
Date: Thu, 15 Nov 2012 11:57:32 +0000
Message-ID: <20121115115732.8F2043E09BB@localhost>
References: <20121030143911.GA20034@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121030143911.GA20034@localhost>
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
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 30 Oct 2012 22:39:11 +0800, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Grant,
> 
> Here is an aged warning in sparc allyesconfig builds and it seems that
> attach_one_i2c() is only called by bbc_envctrl_init().
> 
> WARNING: drivers/built-in.o(.devinit.text+0xa9b48): Section mismatch in reference from the function bbc_i2c_probe() to the function .init.text:attach_one_i2c.constprop.1()
> The function __devinit bbc_i2c_probe() references
> a function __init attach_one_i2c.constprop.1().
> If attach_one_i2c.constprop.1 is only used by bbc_i2c_probe then
> annotate attach_one_i2c.constprop.1 with a matching annotation.

Looks like attach_one_i2c needs to be switched to __devinit. I don't
have any involvement with that code though. Craft a patch and send it to
the sparc list.

g.
