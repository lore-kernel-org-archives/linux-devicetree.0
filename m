From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 05/20] firmware: arm_scmi: add scmi protocol bus to
 enumerate protocol devices
Date: Mon, 19 Feb 2018 12:35:42 +0100
Message-ID: <CAK8P3a1wBBVZnd6ns5K-HhQ28WKAwVbaWsnmE+83SyOnTQt4_w@mail.gmail.com>
References: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com>
 <1514904162-11201-6-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1514904162-11201-6-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Nishanth Menon <nm@ti.com>, DTML <devicetree@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Harb Abdulhamid <harba@codeaurora.org>, Ryan Harkin <Ryan.Harkin@arm.com>, LKML <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Alexey Klimov <klimov.linux@gmail.com>, Loc Ho <lho@apm.com>, ALKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 2, 2018 at 3:42 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> +#ifdef CONFIG_ARM_SCMI_PROTOCOL
> +int scmi_driver_register(struct scmi_driver *driver,
> +                        struct module *owner, const char *mod_name);
> +void scmi_driver_unregister(struct scmi_driver *driver);
> +#else
> +static int scmi_driver_register(struct scmi_driver *driver,
> +                               struct module *owner, const char *mod_name)
> +{
> +       return -EINVAL;
> +}
> +static void scmi_driver_unregister(struct scmi_driver *driver) {}
> +#endif /* CONFIG_ARM_SCMI_PROTOCOL */

The dummy helpers must be 'static inline', not just 'static', otherwise you
get a warning when this header is included by a file that doesn't call
both of them.


      Arnd
