From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: HOWTO Undo/Revert of_platform_populate?
Date: Mon, 15 Apr 2013 14:40:09 +0100
Message-ID: <20130415134009.0A70E3E0AA8@localhost>
References: <CAPybu_3LfWLYLSn52dgFDuBTASLvQ0_XWsywH=Avpma+4s921g@mail.gmail.com>
 <51392BD9.4010209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51392BD9.4010209-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 07 Mar 2013 18:07:53 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 03/07/2013 04:32 AM, Ricardo Ribalda Delgado wrote:
> > Hi
> > 
> > I have an FPGA attached to the pci bus. The FPGA has an internal bus
> > with multiple cores that are already supported in the kernel.
> > 
> > I have made a driver that populates those cores using a user provided
> > device tree. I use the function of_platform_populate for that.
> > 
> > All this is working fine, but now I need a method to undo what
> > of_platform_populate does when the fpga is reprogrammed.
> > 
> > I haven't found any function that does this in the api.
> > 
> > Before implementing my own I would like to know if am I missing something?
> 
> It's not possible in the current kernel. You need DT overlay support
> that was posted recently.

In the mean time you can merely recurse all the children of the parent
struct device, unregister them from the device model, and release them.

g.
