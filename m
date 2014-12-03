From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2] usb: {ohci,ehci}-platform: Use new OF big-endian
 helper function
Date: Tue, 2 Dec 2014 16:12:42 -0800
Message-ID: <20141203001242.GA21569@kroah.com>
References: <1417149823-4168-1-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417149823-4168-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 08:43:43PM -0800, Kevin Cernekee wrote:
> This handles the existing "big-endian" case, and in addition, it also does
> the right thing when "native-endian" is specified.
> 
> Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-ehci.txt | 2 ++
>  Documentation/devicetree/bindings/usb/usb-ohci.txt | 2 ++
>  drivers/usb/host/ehci-platform.c                   | 2 +-
>  drivers/usb/host/ohci-platform.c                   | 2 +-
>  4 files changed, 6 insertions(+), 2 deletions(-)
> 
> 
> V1->V2: Tweak documentation per feedback on the list
> 
> This depends on the new of_device_is_big_endian() function, which is being
> handled through Grant's tree.

Feel free to take this one through Grant's tree too:

Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
