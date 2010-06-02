From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] of/usb: fix build error due to of_node pointer move
Date: Wed, 2 Jun 2010 13:07:21 -0700
Message-ID: <20100602200721.GA8622@suse.de>
References: <20100602194022.6780.28819.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100602194022.6780.28819.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 02, 2010 at 01:47:16PM -0600, Grant Likely wrote:
> Fix driver to use new location of of_node pointer (introduced by commit
> use new location of of_node pointer (introduced by commit
> 61c7a080a5a061c976988fd4b844dfb468dda255; of: Always use 'struct
> device.of_node' to get device node pointer)
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Reported-by: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> CC: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
> CC: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> CC: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> ---
> 
> I've applied this patch to my merge-devicetree branch

Fine with me, feel free to add:
	Acked-by: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
if you can and send it off to Linus.

thanks,

greg k-h
