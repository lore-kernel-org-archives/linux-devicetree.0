From: Volodymyr Babchuk <vlad.babchuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 3/4] tee: add OP-TEE driver
Date: Wed, 31 Aug 2016 20:02:49 +0300
Message-ID: <88c4207b-9e18-7b39-ec73-7f9716e51c99@gmail.com>
References: <1471870856-18684-1-git-send-email-jens.wiklander@linaro.org>
 <1471870856-18684-4-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471870856-18684-4-git-send-email-jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 22.08.16 16:00, Jens Wiklander wrote:
> On 31.08.16 16:50, Jerome Forissier wrote:Adds a OP-TEE driver which also can be compiled as a loadable module.
>
> * Targets ARM and ARM64
> * Supports using reserved memory from OP-TEE as shared memory
> * Probes OP-TEE version using SMCs
> * Accepts requests on privileged and unprivileged device
> * Uses OPTEE message protocol version 2 to communicate with secure world
>
> Acked-by: Andreas Dannenberg<dannenberg-l0cyMroinI0@public.gmane.org>
> Reviewed-by: Javier González<javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Jens Wiklander<jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
Tested-by: Volodymyr Babchuk <vlad.babchuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

patches were tested on Renesas Rcar H3 board.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
