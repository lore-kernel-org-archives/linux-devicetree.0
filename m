From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] scripts/dtc: dt_to_config - kernel config options for
 a devicetree
Date: Tue, 21 Jun 2016 14:43:24 -0700
Message-ID: <5769B4FC.1070309@gmail.com>
References: <575B46CE.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B46CE.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/10/16 16:01, Frank Rowand wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> 
> Determining which kernel config options need to be enabled for a
> given devicetree can be a painful process.  Create a new tool to
> find the drivers that may match a devicetree node compatible,
> find the kernel config options that enable the driver, and
> optionally report whether the kernel config option is enabled.
> 
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> ---
> 
> changes from v1
>    - Add --config-format to create config fragment that can be appended
>      to kernel .config
>    - Add short node path option, default to full node path for 
>      --config-format
>    - Add options to use the driver black list, the config white
>      list, and the driver white list (new default is to ignore)
>    - Remove need to hard code config options for hard coded driver.
>      This allowed removal of 8 entries from the hard coded config list.
>    - Remove virt/kvm/arm/.* from driver black list (not needed after
>      commit 503a62862e8f in 4.7-rc1)
>    - Remove fixed-partitions from compatibles white list
>    - Updated the --help message
>    - Remove non-ascii copyright symbol
> 

< snip >

Hi All,

Did this version resolve the issues from v1?

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
