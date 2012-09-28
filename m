From: <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: adding OF_DYNAMIC proc interface - 2nd try
Date: Fri, 28 Sep 2012 13:25:17 -0500
Message-ID: <1348856718-25854-1-git-send-email-atull@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hello,

(Fixed my mail configuration from earlier).

The following patch adds a /proc/ofdt interface to add or remove device tree
nodes dynamically.

Based on earlier feedback, I've changed my driver to use /proc instead of
creating a new ioctl (the old thread is at 
http://www.mail-archive.com/devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg17333.html)

I was hoping to get some early feedback from others who might be interested
who were discussing this on an earlier thread about OF_DYNAMIC usage.

This code doesn't do any notification for drivers yet. It can add multiple
nodes and they will show up properly under /proc/device-tree.  It has an
issue that shows up when removing nodes (it appears that the memory used by
proc gets corrupted after the add).

Alan Tull
Altera
