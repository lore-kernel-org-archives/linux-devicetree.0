From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: adding OF_DYNAMIC proc interface
Date: Sat, 29 Sep 2012 07:29:00 +1000
Message-ID: <1348867740.7621.4.camel@pasglop>
References: <1348850798-24352-1-git-send-email-atull@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348850798-24352-1-git-send-email-atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
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
To: atull@atull-linux1
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2012-09-28 at 11:46 -0500, Alan Tull wrote:
> Hello,
> 
> The following patch adds a /proc/ofdt interface to add or remove device tree
> nodes dynamically.
> 
> Based on earlier feedback, I've changed my driver to use /proc instead of
> creating a new ioctl (the old thread is at 
> http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg17333.html)
> 
> 
> I was hoping to get some early feedback from others who might be interested
> who were discussing this on an earlier thread about OF_DYNAMIC usage.
> 
> This code doesn't do any notification for drivers yet. It can add multiple
> nodes and they will show up properly under /proc/device-tree.  It has an
> issue that shows up when removing nodes (it appears that the memory used by
> proc gets corrupted after the add).

(Adding Arnd here)

Have you guys considered whether a better approach would be a file
system ? IE, create a node by creating a directory, add files for
properties etc... ?

It might need some trick to make the node "active" (in order to not
internally in the kernel start exposing unfinished nodes), maybe a
special file, maybe a permission trick ...

It should be at least considered rather than a new interface that tries
to re-implement semantics (such as notification) that are pretty much
already provided by a fs.

Also, what about the existing /proc/device-tree ?

Finally, if we are doing something new and for some reason not a fs,
what about using sysfs rather than /proc ? Really /proc is not a great
idea here.

Cheers,
Ben.
