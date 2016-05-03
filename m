From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers/of: Add check for null property in of_remove_property()
Date: Tue, 3 May 2016 08:06:48 -0500
Message-ID: <CAL_JsqJCkrjkDDwqznCPbiDVrQUr4pQgHs_YcFVm04-j5XZREA@mail.gmail.com>
References: <1461821695-19204-1-git-send-email-sjitindarsingh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461821695-19204-1-git-send-email-sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 12:34 AM, Suraj Jitindar Singh
<sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The validity of the property input argument to of_remove_property() is
> never checked within the function and thus it is possible to pass a null
> value. It happens that this will be picked up in __of_remove_property()
> as no matching property of the device node will be found and thus an
> error will be returned, however once again there is no explicit check
> for a null value. By the time this is detected 2 locks have already been
> acquired which is completely unnecessary if the property to remove is
> null.
>
> Add an explicit check in the function of_remove_property() for a null
> property value and return -ENODEV in this case, this is consistent with
> what the previous return value would have been when the null value was
> not detected and passed to __of_remove_property().
>
> By moving an explicit check for the property paramenter into the
> of_remove_property() function, this will remove the need to perform this
> check in calling code before invocation of the of_remove_property()
> function.
>
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

For both patches:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
