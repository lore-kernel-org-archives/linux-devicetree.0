From: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 06/21] c6x: convert fdt pointers to opaque pointers
Date: Thu, 24 Apr 2014 10:21:25 -0400
Message-ID: <1398349285.3010.63.camel@deneb.redhat.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
	 <1398215901-25609-7-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398215901-25609-7-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-22 at 20:18 -0500, Rob Herring wrote:
> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> The architecture code does not need to access the internals of the FDT
> blob, so make the pointer to it void *.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>
> Cc: linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org
> ---

Acked-by: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
