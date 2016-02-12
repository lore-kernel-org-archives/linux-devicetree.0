From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 2/4] tee: generic TEE subsystem
Date: Thu, 11 Feb 2016 19:15:51 -0800
Message-ID: <20160212031551.GA10157@kroah.com>
References: <1455210877-15748-1-git-send-email-jens.wiklander@linaro.org>
 <1455210877-15748-3-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455210877-15748-3-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 06:14:35PM +0100, Jens Wiklander wrote:
> Initial patch for generic TEE subsystem.
> This subsystem provides:
> * Registration/un-registration of TEE drivers.
> * Shared memory between normal world and secure world.
> * Ioctl interface for interaction with user space.
> * Sysfs implementation_id of TEE driver
>=20
> A TEE (Trusted Execution Environment) driver is a driver that interfa=
ces
> with a trusted OS running in some secure environment, for example,
> TrustZone on ARM cpus, or a separate secure co-processor etc.
>=20
> The TEE subsystem can serve a TEE driver for a Global Platform compli=
ant
> TEE, but it's not limited to only Global Platform TEEs.
>=20
> This patch builds on other similar implementations trying to solve
> the same problem:
> * "optee_linuxdriver" by among others
>   Jean-michel DELORME<jean-michel.delorme@st.com> and
>   Emmanuel MICHEL <emmanuel.michel@st.com>
> * "Generic TrustZone Driver" by Javier Gonz=E1lez <javier@javigon.com=
>
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

I need you to get other people to review this before I can accept this
series.  Please do that, surely someone else cares about this code
becides you?

thanks,

greg k-h
