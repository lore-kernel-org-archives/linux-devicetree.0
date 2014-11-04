From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/1] Compact interface for Device-Tree
Date: Tue, 04 Nov 2014 17:25:58 +0100
Message-ID: <4742258.TBitC3hVuO@wuerfel>
References: <1414709964-27284-1-git-send-email-gavidov@codeaurora.org> <40803956.DTL7dD7CLv@wuerfel> <20141104155329.A23A5C423D0@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20141104155329.A23A5C423D0@trevor.secretlab.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robherring2@gmail.com>, Gilad Avidov <gavidov@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sagar Dharia <sdharia@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 November 2014 15:53:29 Grant Likely wrote:
> On Mon, 03 Nov 2014 16:06:03 +0100
> , Arnd Bergmann <arnd@arndb.de>
>  wrote:
> > On Friday 31 October 2014 23:53:28 Rafael J. Wysocki wrote:
> > > On Saturday, November 01, 2014 05:13:45 AM Rob Herring wrote:
> > > > On Fri, Oct 31, 2014 at 6:59 AM, Gilad Avidov <gavidov@codeauro=
ra.org> wrote:
> > > > >
> > > > > Device-Tree compact API
> > > > > ------------------------
> > > > >
> > > > > Common code seen in driver=E2=80=99s probe reads device tree =
values and handling
> > > > > erroneous return codes from all those of_property_read_xxx() =
 APIs. This
> > > > > common code is factored out by the of_property_map module whi=
ch allows
> > > > > driver=E2=80=99s probe to replace that (often lengthy) code w=
ith a concise table:
> > > > >
> > > > > struct of_prop_map map[] =3D {
> > > > >     {"i2c",            &dev->id,        OF_REQ,  OF_ID,  -1},
> > > > >     {"qcom,clk-freq-out",    &dev->clk_freq_out,    OF_REQ,  =
OF_U32,  0},
> > > > >     {"qcom,clk-freq-in",    &dev->clk_freq_in,    OF_REQ,  OF=
_U32,  0},
> > > > >     {"qcom,disable-dma",    &dev->disable_dma,    OF_OPT,  OF=
_BOOL, 0},
> > > > >     {"qcom,master-id",    &dev->mstr_id,        OF_SGST, OF_U=
32,  0},
> > > > >     {NULL,            NULL,            0,       0,       0},
> > > > > };
> > > > >
> > > > > Then call populate to read the values into the device=E2=80=99=
s variables:
> > > > >
> > > > > ret =3D of_prop_populate(dev, dev->of_node, map);
> > > >=20
> > > > Interesting idea. The main concern I have with this is there ha=
s been
> > > > on-going discussions about how to generalize property handling =
across
> > > > DT and ACPI to make drivers more agnostic, so I'm copying a few=
 folks
> > > > involved in that. That may be a bit orthogonal to what this is =
doing,
> > > > but we may want some coordination here.
> > >=20
> > > Agreed.
> > >=20
> > > We actually have a patchset adding a unified device property API =
in=20
> > > linux-next (http://git.kernel.org/cgit/linux/kernel/git/rafael/li=
nux-pm.git/log/?h=3Ddevice-properties)
> > > and I'd prefer to see the "compactization" to happen at that leve=
l, if possible,
> > > rather that for of_ only.
> >=20
> > Agreed, this should definitely use the new generalized API.
> > I have prototyped a similar concept last year, which actually went =
much
> > further and also abstracted high-level properties such as interrupt=
s,
> > gpios, pwm, dma-engine, etc. I still think we should do something
> > like that, but I've never had the time to follow up and nobody else
> > picked up my work from back then.
> >=20
> > Would others like to see that?
>=20
> Absolutely. I also tried to do the same thing and didn't get very far=
=2E
> And, yes, it should be done at the level of the device properties API=
=2E


This is taken from an old email I sent last year on the subject "Re:
[RFC PATCH dtc] C-based DT schema checker integrated into dtc". I haven=
't
actually followed up at all, and couldn't find the file now, so this
is all I have.

	Arnd

#if 0
/* allocate drvdata */
DEVM_ALLOC,

/* request hardware properties */
DEVM_IRQ,
DEVM_IOMAP,
DEVM_GPIO,
DEVM_DMA_SLAVE,
DEVM_PINCTRL,
DEVM_REGULATOR,
DEVM_CLK,
DEVM_PWM,
DEVM_USBPHY,

/* auxiliary information */
DEVM_PROP_BOOL
DEVM_PROP_U32
DEVM_PROP_STRING
#endif

#error don't bother compiling this file, it's only proof-of-concept

struct device;

struct devm_probe {
        int (*initfunc)(struct device *dev, const struct devm_probe *pr=
obe);
        ptrdiff_t offset;
        unsigned int index;
        const char *name;
        void *arg;
        unsigned int flags;
};

/* like offsetof(), but ensures that MEMBER is of type MEMBERTYPE */
#define offsetof_t(TYPE, MEMBER, MEMBERTYPE) \
        ((typeof(MEMBER)*)0 - typeof(MEMBERTYPE*)0 + offsetof((TYPE), (=
MEMBER)))

/* cast 'ptr' to void* and cause a build warning if it wasn't of 'type'=
 before */
#define typecheck_ptr(ptr, type) \
        (void *)(ptr - (type)NULL + (type)NULL)

/*
 * This is the main entry point for drivers:=20
 *
 * Given an zero-terminated array of 'struct devm_probe' entries,
 * this calls all initfunc pointers in the given order. Each initfunc
 * may manipulate a field in the driver_data, as pointed to by
 * the 'offset' member.
 */
int devm_probe(struct device *dev, const struct devm_probe *probe)
{
        int ret;

        for (ret =3D 0; !ret && probe->initfunc, probe++)
                ret =3D probe->initfunc(dev, probe);

        return ret;
}
EXPORT_SYMBOL_GPL(devm_probe);

/*
 * this must be the called before any of the others, or not at
 * all, if dev_set_drvdata() has already been called.
 */
static void devm_probe_alloc_release(struct device *dev, void *res)
{
        dev_set_drvdata(dev, NULL);
}
int devm_probe_alloc(struct device *dev, const struct devm_probe *probe=
)
{
        void *dr;

        if (dev_get_drvdata)
                return -EBUSY;

        dr =3D alloc_dr(devm_probe_alloc_release, probe->offset, GFP_KE=
RNEL);
        if (unlikely(!dr))
                return -ENOMEM;

        dev_set_drvdata(dev, dr);
        set_node_dbginfo(&dr->node, "devm_probe_alloc", size);
        devres_add(dev, dr->data);
}
EXPORT_SYMBOL_GPL(devm_probe_alloc);


#define DEVM_ALLOC(_struct) \
        { .initfunc =3D devm_probe_alloc, .offset =3D sizeof(struct _st=
ruct), }

int devm_probe_irq(struct device *dev, const struct devm_probe *probe)
{
        int ret;
        int irq;
        int *irqp;
        int index;
        const char *name;

        /* come up with a reasonable string for the irq name,
           maybe create devm_kasprintf() to allow arbitrary length? */
        name =3D devm_kmalloc(dev, 32, GFP_KERNEL);
        if (!name)
                return -ENOMEM;
        if (probe->name)
                snprintf(name, 32 - 1, "%s:%s", dev_name(dev), probe->n=
ame);
        else
                snprintf(name, 32 - 1, "%s:%n", dev_name(dev), probe->i=
ndex);

        /* find IRQ number from resource if platform device */
        irq =3D 0;
        if (dev->bus_type =3D=3D &platform_bus) {
                struct platform_device *pdev =3D to_platform_device(dev=
);

                if (probe->name)
                        irq =3D platform_get_irq_byname(pdev, probe->na=
me);
                else
                        irq =3D platform_get_irq(pdev, probe->index);
        }

        /* try getting irq number from device tree if that failed */
        if (!irq && dev->of_node) {
                if (probe->name)
                        index =3D of_property_match_string(dev->of_node=
,
                                                         "interrupt-nam=
es",
                                                         probe->name);
                else
                        index =3D probe->index;

                irq =3D irq_of_parse_and_map(dev->of_node, index);
        }

        /* copy irq number to driver data */
        irqp =3D dev_get_drvdata(dev) + probe->offset;
        *irqp =3D irq;
       =20
        return devm_request_irq(dev, irq, probe->arg, probe->flags, nam=
e, probe->dev);
}
EXPORT_SYMBOL_GPL(devm_probe_irq);

#define DEVM_IRQ(_struct, _member, _index, _handler, _flags) {  \
        .initfunc =3D devm_probe_irq,                             \
        .offset =3D offsetof_t(struct _struct, _member, int),     \
        .index =3D _index,                                        \
        .arg =3D typecheck_ptr((_handler), irq_handler_t),        \
        .flags =3D _flags,                                        \
}      =20

#define DEVM_IRQ_NAMED(_struct, _member, _name, _handler, _flags) { \
        .initfunc =3D devm_probe_irq,                             \
        .offset =3D offsetof_t(struct _struct, _member, int),     \
        .name =3D _name,                                          \
        .arg =3D typecheck_ptr((_handler), irq_handler_t),        \
        .flags =3D _flags,                                        \
}      =20


#define DEVM_IOMAP_NOREQUEST 1

int devm_probe_iomap(struct device *dev, const struct devm_probe *probe=
)
{
        struct resource res, *resp;
        void __iomem *vaddr;
        void * __iomem *vaddrp;
        int ret;

        /* find mem resource from platform device */
        if (dev->bus_type =3D=3D &platform_bus) {
                struct platform_device *pdev =3D to_platform_device(dev=
);

                if (probe->name)
                        resp =3D platform_get_resource_byname(pdev,
                                        IORESOURCE_MEM, probe->name);
                else
                        resp =3D platform_get_resource(pdev,
                                        IORESOURCE_MEM, probe->index);
        }

        /* try getting resource from device tree if that failed */
        if (!resp && dev->of_node) {
                if (probe->name)
                        index =3D of_property_match_string(dev->of_node=
,
                                                         "reg-names",
                                                         probe->name);
                else
                        index =3D probe->index;

                ret =3D of_address_to_resource(dev->of_node, index, &re=
s);
                if (ret)
                        return ret;
                resp =3D &res;
        }


        if (probe->flags & DEVM_IOMAP_NOREQUEST) {
                vaddr =3D devm_ioremap(dev, resp->start, resource_size(=
resp));
                if (!vaddr)
                        return -EINVAL;
        } else {
                vaddr =3D devm_ioremap_resource(dev, resp);
                if (IS_ERR(vaddr))
                        return PTR_ERR(vaddr);
        }

        vaddrp =3D dev_get_drvdata(dev) + probe->offset;
        *vaddrp =3D vaddr;

        return 0;
}
EXPORT_SYMBOL_GPL(devm_probe_iomap);

#define DEVM_IOMAP(_struct, _member, _index, _flags) {                 =
 \
        .initfunc =3D devm_probe_iomap,                                =
   \
        .offset =3D offsetof_t(struct _struct, _member, void __iomem *)=
,  \
        .index =3D _index,                                             =
   \
        .flags =3D _flags,                                             =
   \
}      =20

#define DEVM_IOMAP_NAMED(_struct, _member, _name, _flags) {            =
 \
        .initfunc =3D devm_probe_iomap,                                =
   \
        .offset =3D offsetof_t(struct _struct, _member, void __iomem *)=
,  \
        .name =3D _name,                                               =
   \
        .flags =3D _flags,                                             =
   \
}      =20

int devm_probe_gpio(struct device *dev, const struct devm_probe *probe)
{
        struct gpio_desc *desc, **descp;

        desc =3D devm_gpiod_get_index(dev, probe->name, probe->index);
        if (IS_ERR(desc)) {
                /* FIXME: this looks wrong */
                desc =3D of_get_named_gpiod_flags(dev->of_node, probe->=
name,
                                                probe->index, NULL);
                if (IS_ERR(desc))
                        return PTR_ERR(desc);
                devm_gpio_request(dev, desc_to_gpio(desc), probe->name)=
;
        }

        descp =3D dev_get_drvdata(dev) + probe->offset;
        *descp =3D desc;

        return 0;
}

#define DEVM_GPIO(_struct, _member, _index) {                          =
  \
        .initfunc =3D devm_probe_iomap,                                =
    \
        .offset =3D offsetof_t(struct _struct, _member, struct gpio_des=
c*),\
        .name =3D "gpios",                                             =
    \
        .index =3D _index,                                             =
    \
}      =20

#define DEVM_GPIO_NAMED(_struct, _member, _name) {                     =
  \
        .initfunc =3D devm_probe_iomap,                                =
    \
        .offset =3D offsetof_t(struct _struct, _member, struct gpio_des=
c*),\
        .name =3D _name,                                               =
    \
}      =20

static void devm_probe_dma_release(struct device *dev, void *chanp)
{
        dma_release_channel(*(struct dma_chan**)chanp);
}

int devm_probe_dma(struct device *dev, const struct devm_probe *probe)
{
        struct dma_chan *chan, **chanp;

        /* there is no devm_dma_request_channel yet, so build our own *=
/
        chanp =3D devres_alloc(devm_probe_dma_release, sizeof(chanp), G=
=46P_KERNEL);
        if (!chanp)
                return -ENOMEM;

        chan =3D dma_request_slave_channel(dev, probe->name);
        if (!chan) {
                devres_free(chanp);
                return -EINVAL;
        }

        *chanp =3D chan;
        devres_add(dev, chanp);

        /* add pointer to the private data */
        chanp =3D dev_get_drvdata(dev) + probe->offset;
        *chanp =3D chan;

        return 0;
}

#define DEVM_DMA_SLAVE(_struct, _member, _name)                        =
 \
        .offset =3D offsetof_t(struct _struct, _member, struct dma_chan=
*),\
        .name =3D _name,                                               =
   \
}

/*
 * simple properties: bool, u32, string
 * no actual need for managed interfaces, just a way to abstract the
 * access to DT or other information source
 */
int devm_probe_prop_bool(struct device *dev, struct devm_probe *probe)
{
        bool *val;

        val =3D dev_get_drvdata(dev) + probe->offset;
        *val =3D of_property_read_bool(dev->of_node, probe->name);

        return 0;
}
EXPORT_SYMBOL_GPL(devm_probe_prop_bool);

#define DEVM_PROP_BOOL(_struct, _member, _name)                 \
        .offset =3D offsetof_t(struct _struct, _member, bool),    \
        .name =3D _name,                                          \
}

int devm_probe_prop_u32(struct device *dev, struct devm_probe *probe)
{
        u32 *val;
        int ret;

        val =3D dev_get_drvdata(dev) + probe->offset;
        ret =3D of_property_read_u32(dev->of_node, probe->name, val);

        return ret;
}
EXPORT_SYMBOL_GPL(devm_probe_prop_bool);

#define DEVM_PROP_U32(_struct, _member, _name)                  \
        .offset =3D offsetof_t(struct _struct, _member, u32),     \
        .name =3D _name,                                          \
}

int devm_probe_prop_string(struct device *dev, struct devm_probe *probe=
)
{
        const char **val;
        int ret;

        val =3D dev_get_drvdata(dev) + probe->offset;
        ret =3D of_property_read_string(dev->of_node, probe->name, val)=
;

        return ret;
}
EXPORT_SYMBOL_GPL(devm_probe_prop_bool);

#define DEVM_PROP_STRING(_struct, _member, _name)                      =
 \
        .offset =3D offsetof_t(struct _struct, _member, const char *), =
   \
        .name =3D _name,                                               =
   \
}

/* example driver */
struct foo_priv {
        spinlock_t lock;
        void __iomem *regs;
        int irq;
        struct gpio_desc *gpio;
        struct dma_chan *rxdma;
        struct dma_chan *txdma;
        bool oldstyle_dma;
};

static irqreturn_t foo_irq_handler(int irq, void *dev);

/*
 * this lists all properties we access from the driver. The list
 * is interpreted by devm_probe() and can be programmatically
 * verified to match the binding.
 */
static const struct devm_probe foo_probe_list[] =3D {
        DEVM_ALLOC(foo_priv),
        DEVM_IOMAP(foo_priv, regs, 0, 0),
        DEVM_PROP_BOOL(foo_priv, oldstyle_dma, "foo,oldstyle-dma"),
        DEVM_DMA_SLAVE(foo_priv, rxdma, "rx");
        DEVM_DMA_SLAVE(foo_priv, txdma, "tx");
        DEVM_GPIO(foo_priv, gpio, 0);
        DEVM_IRQ_NAMED(foo_priv, irq, foo_irq_handler, "fifo", IRQF_SHA=
RED),
        {},
};

static int foo_probe(struct platform_device *dev)
{
        int ret;

        ret =3D devm_probe(dev->dev, foo_probe_list);
        if (ret)
                return ret;

        return bar_subsystem_register(&foo_bar_ops, dev);
}
