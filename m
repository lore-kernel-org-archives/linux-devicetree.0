From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 4/7] clk: Add clock driver for mb86s7x
Date: Thu, 26 Feb 2015 11:36:00 +0530
Message-ID: <CAJe_Zhdx446EjgD9FFgNt34vXErTaG0d3AJwda5+A7CL7M=ENg@mail.gmail.com>
References: <1423188007-17047-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1423188649-17216-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<20150225195912.421.69267@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150225195912.421.69267@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 February 2015 at 01:29, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Vincent Yang (2015-02-05 18:10:49)

>> +static struct clk *crg11_get(struct of_phandle_args *clkspec, void *data)
>> +{
>> +       struct mb86s70_crg11 *crg11 = data;
>> +       struct clk_init_data init;
>> +       u32 cntrlr, domain, port;
>> +       struct crg_clk *crgclk;
>> +       struct clk *clk;
>> +       char clkp[20];
>> +
>> +       if (clkspec->args_count != 3)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       cntrlr = clkspec->args[0];
>> +       domain = clkspec->args[1];
>> +       port = clkspec->args[2];
>> +
>> +       if (port > 7)
>> +               snprintf(clkp, 20, "UngatedCLK%d_%X", cntrlr, domain);
>> +       else
>> +               snprintf(clkp, 20, "CLK%d_%X_%d", cntrlr, domain, port);
>> +
>> +       mutex_lock(&crg11->lock);
>> +
>> +       clk = __clk_lookup(clkp);
>> +       if (clk) {
>> +               mutex_unlock(&crg11->lock);
>> +               return clk;
>> +       }
>
> What is the above code doing? It looks like you are checking to see if
> you are trying to register a clock that is already registered. Why do
> you need this?
>
The clocks are populated runtime as clients need them. If two clients
need a clock the second shouldn't populate a copy. Please see the
bindings specified in this patch.

>> +
>> +       crgclk = kzalloc(sizeof(*crgclk), GFP_KERNEL);
>> +       if (!crgclk) {
>> +               mutex_unlock(&crg11->lock);
>> +               return ERR_PTR(-ENOMEM);
>> +       }
>> +
>> +       init.name = clkp;
>> +       init.num_parents = 0;
>> +       init.ops = &crg_port_ops;
>> +       init.flags = CLK_IS_ROOT;
>> +       crgclk->hw.init = &init;
>> +       crgclk->cntrlr = cntrlr;
>> +       crgclk->domain = domain;
>> +       crgclk->port = port;
>> +       clk = clk_register(NULL, &crgclk->hw);
>> +       if (IS_ERR(clk))
>> +               pr_err("%s:%d Error!\n", __func__, __LINE__);
>> +       else
>> +               pr_debug("Registered %s\n", clkp);
>> +
>> +       clk_register_clkdev(clk, clkp, NULL);
>> +       mutex_unlock(&crg11->lock);
>> +       return clk;
>> +}
>> +
>> +static void __init crg_port_init(struct device_node *node)
>> +{
>> +       struct mb86s70_crg11 *crg11;
>> +
>> +       crg11 = kzalloc(sizeof(*crg11), GFP_KERNEL);
>> +       if (!crg11)
>> +               return;
>> +
>> +       mutex_init(&crg11->lock);
>> +
>> +       of_clk_add_provider(node, crg11_get, crg11);
>> +}
>> +CLK_OF_DECLARE(crg11_gate, "fujitsu,mb86s70-crg11", crg_port_init);
>> +
>> +struct cl_clk {
>> +       struct clk_hw hw;
>> +       int cluster;
>> +};
>> +
>> +struct mb86s7x_cpu_freq {
>> +       u32 payload_size;
>> +       u32 cluster_class;
>> +       u32 cluster_id;
>> +       u32 cpu_id;
>> +       u64 freqency;
>
> s/freqency/frequency/
>
:)

>> +};
>> +
>> +static void mhu_cluster_rate(struct clk_hw *hw, unsigned long *rate, int get)
>> +{
>> +       struct cl_clk *clc = to_clc_clk(hw);
>> +       struct mb86s7x_cpu_freq cmd;
>> +       int code, ret;
>> +
>> +       cmd.payload_size = sizeof(cmd);
>> +       cmd.cluster_class = 0;
>> +       cmd.cluster_id = clc->cluster;
>> +       cmd.cpu_id = 0;
>> +       cmd.freqency = *rate;
>> +
>> +       if (get)
>> +               code = CMD_CPU_CLOCK_RATE_GET_REQ;
>> +       else
>> +               code = CMD_CPU_CLOCK_RATE_SET_REQ;
>> +
>> +       pr_debug("%s:%d CMD Cl_Class-%u CL_ID-%u CPU_ID-%u Freq-%llu}\n",
>> +                __func__, __LINE__, cmd.cluster_class,
>> +                cmd.cluster_id, cmd.cpu_id, cmd.freqency);
>> +
>> +       ret = mb86s7x_send_packet(code, &cmd, sizeof(cmd));
>> +       if (ret < 0) {
>> +               pr_err("%s:%d failed!\n", __func__, __LINE__);
>> +               return;
>> +       }
>> +
>> +       pr_debug("%s:%d REP Cl_Class-%u CL_ID-%u CPU_ID-%u Freq-%llu}\n",
>> +                __func__, __LINE__, cmd.cluster_class,
>> +                cmd.cluster_id, cmd.cpu_id, cmd.freqency);
>> +
>> +       *rate = cmd.freqency;
>
> Also why is this frequency u64 when all of the uses of it are unsigned
> long?
>
The firmware of remote has chosen to report frequency as a u64.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
