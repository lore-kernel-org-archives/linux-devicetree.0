From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v6 18/23] drivers/fsi: Document FSI master sysfs files in ABI
Date: Wed, 10 May 2017 17:00:42 +0930
Message-ID: <CACPK8Xc4kv1Y_82ShYAfNjzf480Ab1ws95QSxPT8VE2XF+nueA@mail.gmail.com>
References: <20170410194706.64280-1-cbostic@linux.vnet.ibm.com> <20170410194706.64280-19-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170410194706.64280-19-cbostic@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, rostedt@goodmis.org, mingo@redhat.com, Greg KH <gregkh@linuxfoundation.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 11, 2017 at 5:17 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> From: Chris Bostic <cbostic@linux.vnet.ibm.com>
>
> Add info for sysfs scan file in Documentaiton ABI/testing

You are missing documentation for the 'raw', 'term' and 'break' files.

> Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-fsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-fsi
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-fsi b/Documentation/ABI/testing/sysfs-bus-fsi
> new file mode 100644
> index 0000000..dfcbc1b
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-fsi
> @@ -0,0 +1,6 @@
> +What:           /sys/bus/platform/devices/fsi-master/scan

This has been renamed 'rescan' in this series. The path has changed too.

> +KernelVersion:  4.9

This should be 4.12 I guess, assuming we get it merged this cycle.

> +Contact:        cbostic@us.ibm.com
> +Description:
> +                Initiates a FSI master scan for all connected
> +                slave devices on its links.
> --
> 1.8.2.2
>
