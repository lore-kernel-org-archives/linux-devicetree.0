Return-Path: <SRS0=crLj=L6=joelfernandes.org=joel@kernel.org>
MIME-Version: 1.0
References: <cover.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <b9b60ff2864a17fb05481aa33f90114ab051d6ce.1536430404.git.saiprakash.ranjan@codeaurora.org>
 <141901b8-0a9a-2e7a-f7a4-cdefd157f4c6@codeaurora.org>
In-Reply-To: <141901b8-0a9a-2e7a-f7a4-cdefd157f4c6@codeaurora.org>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Sun, 16 Sep 2018 06:55:05 -0700
Message-ID: <CAEXW_YSPNqVgoYWjVAMvGg_WoRV4SC2xDH1wQWTdQfBUOMQbbQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] pstore: Add event tracing support
Content-Type: multipart/alternative; boundary="0000000000001a1fb60575fd68dc"
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Colin Cross <ccross@android.com>, Jason Baron <jbaron@akamai.com>, Tony Luck <tony.luck@intel.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>, Jim Cromie <jim.cromie@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, Prasad Sodagudi <psodagud@codeaurora.org>, tsoni@codeaurora.org, Bryan Huntsman <bryanh@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, robh@kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000001a1fb60575fd68dc
Content-Type: text/plain; charset="UTF-8"

Sorry for the top post. I've been wanting to do this as well for some time.
It's quite useful. I am out of office this week and away from work machine.
I will take a look at your patches next week once I'm back at work. Thanks.

Best,
J

On Sun, Sep 16, 2018, 12:08 AM Sai Prakash Ranjan <
saiprakash.ranjan@codeaurora.org> wrote:

> On 9/9/2018 1:57 AM, Sai Prakash Ranjan wrote:
> > Currently pstore has function trace support which can be
> > used to get the function call chain with limited data.
> > Event tracing has extra data which is useful to debug wide
> > variety of issues and is heavily used across the kernel.
> >
> > Adding this support to pstore can be very helpful to debug
> > different subsystems since almost all of them have trace
> > events already available. And also it is useful to debug
> > unknown resets or crashes since we can get lot more info
> > from event tracing by viewing the last occurred events.
> >
> > High frequency tracepoints such as sched and irq has also
> > been tested. This implementation is similar to "tp_printk"
> > command line feature of ftrace by Steven.
> >
> > For example, sample pstore output of tracing sched events
> > after reboot:
> >
> >    # mount -t pstore pstore /sys/fs/pstore/
> >    # tail /sys/fs/pstore/event-ramoops-0
> >    sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120
> prev_state=S ==> next_comm=rcu_preempt next_pid=10 next_prio=120
> >    sched_switch: prev_comm=rcu_preempt prev_pid=10 prev_prio=120
> prev_state=R+ ==> next_comm=swapper/1 next_pid=0 next_prio=120
> >    sched_waking: comm=rcu_sched pid=11 prio=120 target_cpu=002
> >    sched_wakeup: comm=rcu_sched pid=11 prio=120 target_cpu=002
> >    sched_switch: prev_comm=swapper/2 prev_pid=0 prev_prio=120
> prev_state=S ==> next_comm=rcu_sched next_pid=11 next_prio=120
> >    sched_switch: prev_comm=rcu_sched prev_pid=11 prev_prio=120
> prev_state=R+ ==> next_comm=swapper/2 next_pid=0 next_prio=120
> >    sched_waking: comm=reboot pid=1867 prio=120 target_cpu=000
> >    sched_wakeup: comm=reboot pid=1867 prio=120 target_cpu=000
> >    sched_switch: prev_comm=swapper/0 prev_pid=0 prev_prio=120
> prev_state=S ==> next_comm=reboot next_pid=1867 next_prio=120
> >
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > ---
> >   fs/pstore/Kconfig          |  2 +-
> >   fs/pstore/ftrace.c         | 55 ++++++++++++++++++++++++++++++++++++++
> >   fs/pstore/inode.c          |  4 +++
> >   fs/pstore/ram.c            | 44 +++++++++++++++++++++++++++---
> >   include/linux/pstore.h     |  2 ++
> >   include/linux/pstore_ram.h |  1 +
> >   6 files changed, 104 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> > index 503086f7f7c1..6fe087b13a51 100644
> > --- a/fs/pstore/Kconfig
> > +++ b/fs/pstore/Kconfig
> > @@ -126,7 +126,7 @@ config PSTORE_PMSG
> >
> >   config PSTORE_FTRACE
> >       bool "Persistent function tracer"
> > -     depends on PSTORE
> > +     depends on PSTORE && PSTORE!=m
> >       depends on FUNCTION_TRACER
> >       depends on DEBUG_FS
> >       help
> > diff --git a/fs/pstore/ftrace.c b/fs/pstore/ftrace.c
> > index 06aab07b6bb7..d47dc93ac098 100644
> > --- a/fs/pstore/ftrace.c
> > +++ b/fs/pstore/ftrace.c
> > @@ -24,6 +24,8 @@
> >   #include <linux/debugfs.h>
> >   #include <linux/err.h>
> >   #include <linux/cache.h>
> > +#include <linux/slab.h>
> > +#include <linux/trace_events.h>
> >   #include <asm/barrier.h>
> >   #include "internal.h"
> >
> > @@ -62,6 +64,59 @@ static struct ftrace_ops pstore_ftrace_ops
> __read_mostly = {
> >       .func   = pstore_ftrace_call,
> >   };
> >
> > +void notrace pstore_event_call(struct trace_event_buffer *fbuffer)
> > +{
> > +     struct trace_iterator *iter;
> > +     struct trace_seq *s;
> > +     struct trace_event_call *event_call;
> > +     struct pstore_record record;
> > +     struct trace_event *event;
> > +     struct seq_buf *seq;
> > +     unsigned long flags;
> > +
> > +     if (!psinfo)
> > +             return;
> > +
> > +     if (unlikely(oops_in_progress))
> > +             return;
> > +
> > +     pstore_record_init(&record, psinfo);
> > +     record.type = PSTORE_TYPE_EVENT;
> > +
> > +     iter = kmalloc(sizeof(*iter), GFP_KERNEL);
> > +     if (!iter)
> > +             return;
> > +
> > +     event_call = fbuffer->trace_file->event_call;
> > +     if (!event_call || !event_call->event.funcs ||
> > +         !event_call->event.funcs->trace)
> > +             goto fail_event;
> > +
> > +     event = &fbuffer->trace_file->event_call->event;
> > +
> > +     spin_lock_irqsave(&psinfo->buf_lock, flags);
> > +
> > +     trace_seq_init(&iter->seq);
> > +     iter->ent = fbuffer->entry;
> > +     event_call->event.funcs->trace(iter, 0, event);
> > +     trace_seq_putc(&iter->seq, 0);
> > +
> > +     if (seq->size > psinfo->bufsize)
> > +             seq->size = psinfo->bufsize;
> > +
> > +     s = &iter->seq;
> > +     seq = &s->seq;
> > +
> > +     record.buf = (char *)(seq->buffer);
> > +     record.size = seq->len;
> > +     psinfo->write(&record);
> > +
> > +     spin_unlock_irqrestore(&psinfo->buf_lock, flags);
> > +
> > +fail_event:
> > +     kfree(iter);
> > +}
> > +
> >   static DEFINE_MUTEX(pstore_ftrace_lock);
> >   static bool pstore_ftrace_enabled;
> >
> > diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> > index 5fcb845b9fec..f099152abbbd 100644
> > --- a/fs/pstore/inode.c
> > +++ b/fs/pstore/inode.c
> > @@ -345,6 +345,10 @@ int pstore_mkfile(struct dentry *root, struct
> pstore_record *record)
> >               scnprintf(name, sizeof(name), "console-%s-%llu",
> >                         record->psi->name, record->id);
> >               break;
> > +     case PSTORE_TYPE_EVENT:
> > +             scnprintf(name, sizeof(name), "event-%s-%llu",
> > +                       record->psi->name, record->id);
> > +             break;
> >       case PSTORE_TYPE_FTRACE:
> >               scnprintf(name, sizeof(name), "ftrace-%s-%llu",
> >                         record->psi->name, record->id);
> > diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> > index bbd1e357c23d..f60d41c0309e 100644
> > --- a/fs/pstore/ram.c
> > +++ b/fs/pstore/ram.c
> > @@ -48,6 +48,10 @@ static ulong ramoops_console_size = MIN_MEM_SIZE;
> >   module_param_named(console_size, ramoops_console_size, ulong, 0400);
> >   MODULE_PARM_DESC(console_size, "size of kernel console log");
> >
> > +static ulong ramoops_event_size = MIN_MEM_SIZE;
> > +module_param_named(event_size, ramoops_event_size, ulong, 0400);
> > +MODULE_PARM_DESC(event_size, "size of event log");
> > +
> >   static ulong ramoops_ftrace_size = MIN_MEM_SIZE;
> >   module_param_named(ftrace_size, ramoops_ftrace_size, ulong, 0400);
> >   MODULE_PARM_DESC(ftrace_size, "size of ftrace log");
> > @@ -86,6 +90,7 @@ MODULE_PARM_DESC(ramoops_ecc,
> >   struct ramoops_context {
> >       struct persistent_ram_zone **dprzs;     /* Oops dump zones */
> >       struct persistent_ram_zone *cprz;       /* Console zone */
> > +     struct persistent_ram_zone *eprz;       /* Event zone */
> >       struct persistent_ram_zone **fprzs;     /* Ftrace zones */
> >       struct persistent_ram_zone *mprz;       /* PMSG zone */
> >       phys_addr_t phys_addr;
> > @@ -93,6 +98,7 @@ struct ramoops_context {
> >       unsigned int memtype;
> >       size_t record_size;
> >       size_t console_size;
> > +     size_t event_size;
> >       size_t ftrace_size;
> >       size_t pmsg_size;
> >       int dump_oops;
> > @@ -103,6 +109,7 @@ struct ramoops_context {
> >       /* _read_cnt need clear on ramoops_pstore_open */
> >       unsigned int dump_read_cnt;
> >       unsigned int console_read_cnt;
> > +     unsigned int event_read_cnt;
> >       unsigned int max_ftrace_cnt;
> >       unsigned int ftrace_read_cnt;
> >       unsigned int pmsg_read_cnt;
> > @@ -118,6 +125,7 @@ static int ramoops_pstore_open(struct pstore_info
> *psi)
> >
> >       cxt->dump_read_cnt = 0;
> >       cxt->console_read_cnt = 0;
> > +     cxt->event_read_cnt = 0;
> >       cxt->ftrace_read_cnt = 0;
> >       cxt->pmsg_read_cnt = 0;
> >       return 0;
> > @@ -277,6 +285,11 @@ static ssize_t ramoops_pstore_read(struct
> pstore_record *record)
> >                                          1, &record->id, &record->type,
> >                                          PSTORE_TYPE_CONSOLE, 0);
> >
> > +     if (!prz_ok(prz))
> > +             prz = ramoops_get_next_prz(&cxt->eprz,
> &cxt->event_read_cnt,
> > +                                        1, &record->id, &record->type,
> > +                                        PSTORE_TYPE_EVENT, 0);
> > +
> >       if (!prz_ok(prz))
> >               prz = ramoops_get_next_prz(&cxt->mprz, &cxt->pmsg_read_cnt,
> >                                          1, &record->id, &record->type,
> > @@ -385,6 +398,11 @@ static int notrace ramoops_pstore_write(struct
> pstore_record *record)
> >                       return -ENOMEM;
> >               persistent_ram_write(cxt->cprz, record->buf, record->size);
> >               return 0;
> > +     } else if (record->type == PSTORE_TYPE_EVENT) {
> > +             if (!cxt->eprz)
> > +                     return -ENOMEM;
> > +             persistent_ram_write(cxt->eprz, record->buf, record->size);
> > +             return 0;
> >       } else if (record->type == PSTORE_TYPE_FTRACE) {
> >               int zonenum;
> >
> > @@ -475,6 +493,9 @@ static int ramoops_pstore_erase(struct pstore_record
> *record)
> >       case PSTORE_TYPE_CONSOLE:
> >               prz = cxt->cprz;
> >               break;
> > +     case PSTORE_TYPE_EVENT:
> > +             prz = cxt->eprz;
> > +             break;
> >       case PSTORE_TYPE_FTRACE:
> >               if (record->id >= cxt->max_ftrace_cnt)
> >                       return -EINVAL;
> > @@ -699,6 +720,7 @@ static int ramoops_parse_dt(struct platform_device
> *pdev,
> >
> >       parse_size("record-size", pdata->record_size);
> >       parse_size("console-size", pdata->console_size);
> > +     parse_size("event-size", pdata->event_size);
> >       parse_size("ftrace-size", pdata->ftrace_size);
> >       parse_size("pmsg-size", pdata->pmsg_size);
> >       parse_size("ecc-size", pdata->ecc_info.ecc_size);
> > @@ -747,7 +769,8 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >       }
> >
> >       if (!pdata->mem_size || (!pdata->record_size &&
> !pdata->console_size &&
> > -                     !pdata->ftrace_size && !pdata->pmsg_size)) {
> > +                     !pdata->event_size && !pdata->ftrace_size &&
> > +                     !pdata->pmsg_size)) {
> >               pr_err("The memory size and the record/console size must
> be "
> >                       "non-zero\n");
> >               goto fail_out;
> > @@ -757,6 +780,8 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >               pdata->record_size =
> rounddown_pow_of_two(pdata->record_size);
> >       if (pdata->console_size && !is_power_of_2(pdata->console_size))
> >               pdata->console_size =
> rounddown_pow_of_two(pdata->console_size);
> > +     if (pdata->event_size && !is_power_of_2(pdata->event_size))
> > +             pdata->event_size =
> rounddown_pow_of_two(pdata->event_size);
> >       if (pdata->ftrace_size && !is_power_of_2(pdata->ftrace_size))
> >               pdata->ftrace_size =
> rounddown_pow_of_two(pdata->ftrace_size);
> >       if (pdata->pmsg_size && !is_power_of_2(pdata->pmsg_size))
> > @@ -767,6 +792,7 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >       cxt->memtype = pdata->mem_type;
> >       cxt->record_size = pdata->record_size;
> >       cxt->console_size = pdata->console_size;
> > +     cxt->event_size = pdata->event_size;
> >       cxt->ftrace_size = pdata->ftrace_size;
> >       cxt->pmsg_size = pdata->pmsg_size;
> >       cxt->dump_oops = pdata->dump_oops;
> > @@ -775,8 +801,8 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >
> >       paddr = cxt->phys_addr;
> >
> > -     dump_mem_sz = cxt->size - cxt->console_size - cxt->ftrace_size
> > -                     - cxt->pmsg_size;
> > +     dump_mem_sz = cxt->size - cxt->console_size - cxt->event_size
> > +                     - cxt->ftrace_size - cxt->pmsg_size;
> >       err = ramoops_init_przs("dump", dev, cxt, &cxt->dprzs, &paddr,
> >                               dump_mem_sz, cxt->record_size,
> >                               &cxt->max_dump_cnt, 0, 0);
> > @@ -788,6 +814,11 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >       if (err)
> >               goto fail_init_cprz;
> >
> > +     err = ramoops_init_prz("event", dev, cxt, &cxt->eprz, &paddr,
> > +                            cxt->event_size, 0);
> > +     if (err)
> > +             goto fail_init_eprz;
> > +
> >       cxt->max_ftrace_cnt = (cxt->flags & RAMOOPS_FLAG_FTRACE_PER_CPU)
> >                               ? nr_cpu_ids
> >                               : 1;
> > @@ -825,6 +856,8 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >       cxt->pstore.flags = PSTORE_FLAGS_DMESG;
> >       if (cxt->console_size)
> >               cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
> > +     if (cxt->event_size)
> > +             cxt->pstore.flags |= PSTORE_FLAGS_EVENT;
> >       if (cxt->ftrace_size)
> >               cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
> >       if (cxt->pmsg_size)
> > @@ -845,6 +878,7 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >       record_size = pdata->record_size;
> >       dump_oops = pdata->dump_oops;
> >       ramoops_console_size = pdata->console_size;
> > +     ramoops_event_size = pdata->event_size;
> >       ramoops_pmsg_size = pdata->pmsg_size;
> >       ramoops_ftrace_size = pdata->ftrace_size;
> >
> > @@ -858,6 +892,8 @@ static int ramoops_probe(struct platform_device
> *pdev)
> >       kfree(cxt->pstore.buf);
> >   fail_clear:
> >       cxt->pstore.bufsize = 0;
> > +     persistent_ram_free(cxt->eprz);
> > +fail_init_eprz:
> >       persistent_ram_free(cxt->mprz);
> >   fail_init_mprz:
> >   fail_init_fprz:
> > @@ -877,6 +913,7 @@ static int ramoops_remove(struct platform_device
> *pdev)
> >       kfree(cxt->pstore.buf);
> >       cxt->pstore.bufsize = 0;
> >
> > +     persistent_ram_free(cxt->eprz);
> >       persistent_ram_free(cxt->mprz);
> >       persistent_ram_free(cxt->cprz);
> >       ramoops_free_przs(cxt);
> > @@ -916,6 +953,7 @@ static void ramoops_register_dummy(void)
> >       dummy_data->mem_type = mem_type;
> >       dummy_data->record_size = record_size;
> >       dummy_data->console_size = ramoops_console_size;
> > +     dummy_data->event_size = ramoops_event_size;
> >       dummy_data->ftrace_size = ramoops_ftrace_size;
> >       dummy_data->pmsg_size = ramoops_pmsg_size;
> >       dummy_data->dump_oops = dump_oops;
> > diff --git a/include/linux/pstore.h b/include/linux/pstore.h
> > index a15bc4d48752..c31bb9567b4a 100644
> > --- a/include/linux/pstore.h
> > +++ b/include/linux/pstore.h
> > @@ -44,6 +44,7 @@ enum pstore_type_id {
> >       PSTORE_TYPE_PPC_COMMON  = 6,
> >       PSTORE_TYPE_PMSG        = 7,
> >       PSTORE_TYPE_PPC_OPAL    = 8,
> > +     PSTORE_TYPE_EVENT       = 9,
> >       PSTORE_TYPE_UNKNOWN     = 255
> >   };
> >
> > @@ -193,6 +194,7 @@ struct pstore_info {
> >   #define PSTORE_FLAGS_CONSOLE        (1 << 1)
> >   #define PSTORE_FLAGS_FTRACE (1 << 2)
> >   #define PSTORE_FLAGS_PMSG   (1 << 3)
> > +#define PSTORE_FLAGS_EVENT   (1 << 4)
> >
> >   extern int pstore_register(struct pstore_info *);
> >   extern void pstore_unregister(struct pstore_info *);
> > diff --git a/include/linux/pstore_ram.h b/include/linux/pstore_ram.h
> > index e6d226464838..f01055c6cc40 100644
> > --- a/include/linux/pstore_ram.h
> > +++ b/include/linux/pstore_ram.h
> > @@ -95,6 +95,7 @@ struct ramoops_platform_data {
> >       unsigned int    mem_type;
> >       unsigned long   record_size;
> >       unsigned long   console_size;
> > +     unsigned long   event_size;
> >       unsigned long   ftrace_size;
> >       unsigned long   pmsg_size;
> >       int             dump_oops;
> >
>
> Hi,
>
> Anyone here?
>

--0000000000001a1fb60575fd68dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Sorry for the top post. I&#39;ve been wanting to do =
this as well for some time. It&#39;s quite useful. I am out of office this =
week and away from work machine. I will take a look at your patches next we=
ek once I&#39;m back at work. Thanks.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Best,</div><div dir=3D"auto">J</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"lt=
r">On Sun, Sep 16, 2018, 12:08 AM Sai Prakash Ranjan &lt;<a href=3D"mailto:=
saiprakash.ranjan@codeaurora.org">saiprakash.ranjan@codeaurora.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On 9/9/2018 1:57 AM, Sai Pra=
kash Ranjan wrote:<br>
&gt; Currently pstore has function trace support which can be<br>
&gt; used to get the function call chain with limited data.<br>
&gt; Event tracing has extra data which is useful to debug wide<br>
&gt; variety of issues and is heavily used across the kernel.<br>
&gt; <br>
&gt; Adding this support to pstore can be very helpful to debug<br>
&gt; different subsystems since almost all of them have trace<br>
&gt; events already available. And also it is useful to debug<br>
&gt; unknown resets or crashes since we can get lot more info<br>
&gt; from event tracing by viewing the last occurred events.<br>
&gt; <br>
&gt; High frequency tracepoints such as sched and irq has also<br>
&gt; been tested. This implementation is similar to &quot;tp_printk&quot;<b=
r>
&gt; command line feature of ftrace by Steven.<br>
&gt; <br>
&gt; For example, sample pstore output of tracing sched events<br>
&gt; after reboot:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 # mount -t pstore pstore /sys/fs/pstore/<br>
&gt;=C2=A0 =C2=A0 # tail /sys/fs/pstore/event-ramoops-0<br>
&gt;=C2=A0 =C2=A0 sched_switch: prev_comm=3Dswapper/1 prev_pid=3D0 prev_pri=
o=3D120 prev_state=3DS =3D=3D&gt; next_comm=3Drcu_preempt next_pid=3D10 nex=
t_prio=3D120<br>
&gt;=C2=A0 =C2=A0 sched_switch: prev_comm=3Drcu_preempt prev_pid=3D10 prev_=
prio=3D120 prev_state=3DR+ =3D=3D&gt; next_comm=3Dswapper/1 next_pid=3D0 ne=
xt_prio=3D120<br>
&gt;=C2=A0 =C2=A0 sched_waking: comm=3Drcu_sched pid=3D11 prio=3D120 target=
_cpu=3D002<br>
&gt;=C2=A0 =C2=A0 sched_wakeup: comm=3Drcu_sched pid=3D11 prio=3D120 target=
_cpu=3D002<br>
&gt;=C2=A0 =C2=A0 sched_switch: prev_comm=3Dswapper/2 prev_pid=3D0 prev_pri=
o=3D120 prev_state=3DS =3D=3D&gt; next_comm=3Drcu_sched next_pid=3D11 next_=
prio=3D120<br>
&gt;=C2=A0 =C2=A0 sched_switch: prev_comm=3Drcu_sched prev_pid=3D11 prev_pr=
io=3D120 prev_state=3DR+ =3D=3D&gt; next_comm=3Dswapper/2 next_pid=3D0 next=
_prio=3D120<br>
&gt;=C2=A0 =C2=A0 sched_waking: comm=3Dreboot pid=3D1867 prio=3D120 target_=
cpu=3D000<br>
&gt;=C2=A0 =C2=A0 sched_wakeup: comm=3Dreboot pid=3D1867 prio=3D120 target_=
cpu=3D000<br>
&gt;=C2=A0 =C2=A0 sched_switch: prev_comm=3Dswapper/0 prev_pid=3D0 prev_pri=
o=3D120 prev_state=3DS =3D=3D&gt; next_comm=3Dreboot next_pid=3D1867 next_p=
rio=3D120<br>
&gt; <br>
&gt; Signed-off-by: Sai Prakash Ranjan &lt;<a href=3D"mailto:saiprakash.ran=
jan@codeaurora.org" target=3D"_blank" rel=3D"noreferrer">saiprakash.ranjan@=
codeaurora.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0fs/pstore/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0fs/pstore/ftrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 55 +=
+++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0fs/pstore/inode.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 +++<br>
&gt;=C2=A0 =C2=A0fs/pstore/ram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 44 +++++++++++++++++++++++++++---<br>
&gt;=C2=A0 =C2=A0include/linux/pstore.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0include/linux/pstore_ram.h |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A06 files changed, 104 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig<br>
&gt; index 503086f7f7c1..6fe087b13a51 100644<br>
&gt; --- a/fs/pstore/Kconfig<br>
&gt; +++ b/fs/pstore/Kconfig<br>
&gt; @@ -126,7 +126,7 @@ config PSTORE_PMSG<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0config PSTORE_FTRACE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Persistent function tracer&quot;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on PSTORE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on PSTORE &amp;&amp; PSTORE!=3Dm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on FUNCTION_TRACER<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DEBUG_FS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; diff --git a/fs/pstore/ftrace.c b/fs/pstore/ftrace.c<br>
&gt; index 06aab07b6bb7..d47dc93ac098 100644<br>
&gt; --- a/fs/pstore/ftrace.c<br>
&gt; +++ b/fs/pstore/ftrace.c<br>
&gt; @@ -24,6 +24,8 @@<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/debugfs.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/err.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/cache.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +#include &lt;linux/trace_events.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;asm/barrier.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &quot;internal.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -62,6 +64,59 @@ static struct ftrace_ops pstore_ftrace_ops __read_m=
ostly =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.func=C2=A0 =C2=A0=3D pstore_ftrace_call,<br=
>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +void notrace pstore_event_call(struct trace_event_buffer *fbuffer)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct trace_iterator *iter;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct trace_seq *s;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct trace_event_call *event_call;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pstore_record record;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct trace_event *event;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct seq_buf *seq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!psinfo)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (unlikely(oops_in_progress))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pstore_record_init(&amp;record, psinfo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0record.type =3D PSTORE_TYPE_EVENT;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iter =3D kmalloc(sizeof(*iter), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!iter)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0event_call =3D fbuffer-&gt;trace_file-&gt;event_c=
all;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!event_call || !event_call-&gt;event.funcs ||=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!event_call-&gt;event.funcs-&gt;tra=
ce)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_event;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0event =3D &amp;fbuffer-&gt;trace_file-&gt;event_c=
all-&gt;event;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;psinfo-&gt;buf_lock, flags=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0trace_seq_init(&amp;iter-&gt;seq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iter-&gt;ent =3D fbuffer-&gt;entry;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0event_call-&gt;event.funcs-&gt;trace(iter, 0, eve=
nt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0trace_seq_putc(&amp;iter-&gt;seq, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (seq-&gt;size &gt; psinfo-&gt;bufsize)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seq-&gt;size =3D psin=
fo-&gt;bufsize;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0s =3D &amp;iter-&gt;seq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0seq =3D &amp;s-&gt;seq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0record.buf =3D (char *)(seq-&gt;buffer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0record.size =3D seq-&gt;len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0psinfo-&gt;write(&amp;record);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;psinfo-&gt;buf_lock, =
flags);<br>
&gt; +<br>
&gt; +fail_event:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(iter);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static DEFINE_MUTEX(pstore_ftrace_lock);<br>
&gt;=C2=A0 =C2=A0static bool pstore_ftrace_enabled;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c<br>
&gt; index 5fcb845b9fec..f099152abbbd 100644<br>
&gt; --- a/fs/pstore/inode.c<br>
&gt; +++ b/fs/pstore/inode.c<br>
&gt; @@ -345,6 +345,10 @@ int pstore_mkfile(struct dentry *root, struct pst=
ore_record *record)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scnprintf(name, =
sizeof(name), &quot;console-%s-%llu&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0record-&gt;psi-&gt;name, record-&gt;id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case PSTORE_TYPE_EVENT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scnprintf(name, sizeo=
f(name), &quot;event-%s-%llu&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0record-&gt;psi-&gt;name, record-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSTORE_TYPE_FTRACE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scnprintf(name, =
sizeof(name), &quot;ftrace-%s-%llu&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0record-&gt;psi-&gt;name, record-&gt;id);<br>
&gt; diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c<br>
&gt; index bbd1e357c23d..f60d41c0309e 100644<br>
&gt; --- a/fs/pstore/ram.c<br>
&gt; +++ b/fs/pstore/ram.c<br>
&gt; @@ -48,6 +48,10 @@ static ulong ramoops_console_size =3D MIN_MEM_SIZE;=
<br>
&gt;=C2=A0 =C2=A0module_param_named(console_size, ramoops_console_size, ulo=
ng, 0400);<br>
&gt;=C2=A0 =C2=A0MODULE_PARM_DESC(console_size, &quot;size of kernel consol=
e log&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static ulong ramoops_event_size =3D MIN_MEM_SIZE;<br>
&gt; +module_param_named(event_size, ramoops_event_size, ulong, 0400);<br>
&gt; +MODULE_PARM_DESC(event_size, &quot;size of event log&quot;);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static ulong ramoops_ftrace_size =3D MIN_MEM_SIZE;<br>
&gt;=C2=A0 =C2=A0module_param_named(ftrace_size, ramoops_ftrace_size, ulong=
, 0400);<br>
&gt;=C2=A0 =C2=A0MODULE_PARM_DESC(ftrace_size, &quot;size of ftrace log&quo=
t;);<br>
&gt; @@ -86,6 +90,7 @@ MODULE_PARM_DESC(ramoops_ecc,<br>
&gt;=C2=A0 =C2=A0struct ramoops_context {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct persistent_ram_zone **dprzs;=C2=A0 =
=C2=A0 =C2=A0/* Oops dump zones */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct persistent_ram_zone *cprz;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Console zone */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct persistent_ram_zone *eprz;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Event zone */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct persistent_ram_zone **fprzs;=C2=A0 =
=C2=A0 =C2=A0/* Ftrace zones */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct persistent_ram_zone *mprz;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* PMSG zone */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phys_addr_t phys_addr;<br>
&gt; @@ -93,6 +98,7 @@ struct ramoops_context {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int memtype;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t record_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t console_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t event_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t ftrace_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t pmsg_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int dump_oops;<br>
&gt; @@ -103,6 +109,7 @@ struct ramoops_context {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* _read_cnt need clear on ramoops_pstore_op=
en */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int dump_read_cnt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int console_read_cnt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int event_read_cnt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int max_ftrace_cnt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ftrace_read_cnt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int pmsg_read_cnt;<br>
&gt; @@ -118,6 +125,7 @@ static int ramoops_pstore_open(struct pstore_info =
*psi)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;dump_read_cnt =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;console_read_cnt =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cxt-&gt;event_read_cnt =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;ftrace_read_cnt =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pmsg_read_cnt =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; @@ -277,6 +285,11 @@ static ssize_t ramoops_pstore_read(struct pstore_=
record *record)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1, &amp;record-&gt;id, &amp;record-&gt;type,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PSTORE_TYPE_CONSOLE, 0);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prz_ok(prz))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prz =3D ramoops_get_n=
ext_prz(&amp;cxt-&gt;eprz, &amp;cxt-&gt;event_read_cnt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, &=
amp;record-&gt;id, &amp;record-&gt;type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PSTO=
RE_TYPE_EVENT, 0);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prz_ok(prz))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prz =3D ramoops_=
get_next_prz(&amp;cxt-&gt;mprz, &amp;cxt-&gt;pmsg_read_cnt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1, &amp;record-&gt;id, &amp;record-&gt;type,<br>
&gt; @@ -385,6 +398,11 @@ static int notrace ramoops_pstore_write(struct ps=
tore_record *record)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -ENOMEM;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0persistent_ram_w=
rite(cxt-&gt;cprz, record-&gt;buf, record-&gt;size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (record-&gt;type =3D=3D PSTORE_TYPE_EVE=
NT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cxt-&gt;eprz)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0persistent_ram_write(=
cxt-&gt;eprz, record-&gt;buf, record-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (record-&gt;type =3D=3D PSTORE_TYP=
E_FTRACE) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int zonenum;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -475,6 +493,9 @@ static int ramoops_pstore_erase(struct pstore_reco=
rd *record)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSTORE_TYPE_CONSOLE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prz =3D cxt-&gt;=
cprz;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case PSTORE_TYPE_EVENT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prz =3D cxt-&gt;eprz;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case PSTORE_TYPE_FTRACE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (record-&gt;i=
d &gt;=3D cxt-&gt;max_ftrace_cnt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -EINVAL;<br>
&gt; @@ -699,6 +720,7 @@ static int ramoops_parse_dt(struct platform_device=
 *pdev,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_size(&quot;record-size&quot;, pdata-&g=
t;record_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_size(&quot;console-size&quot;, pdata-&=
gt;console_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0parse_size(&quot;event-size&quot;, pdata-&gt;even=
t_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_size(&quot;ftrace-size&quot;, pdata-&g=
t;ftrace_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_size(&quot;pmsg-size&quot;, pdata-&gt;=
pmsg_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_size(&quot;ecc-size&quot;, pdata-&gt;e=
cc_info.ecc_size);<br>
&gt; @@ -747,7 +769,8 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pdata-&gt;mem_size || (!pdata-&gt;recor=
d_size &amp;&amp; !pdata-&gt;console_size &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0!pdata-&gt;ftrace_size &amp;&amp; !pdata-&gt;pmsg_size)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0!pdata-&gt;event_size &amp;&amp; !pdata-&gt;ftrace_size &amp;&amp;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0!pdata-&gt;pmsg_size)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;The=
 memory size and the record/console size must be &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;non-zero\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_out;<b=
r>
&gt; @@ -757,6 +780,8 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;record=
_size =3D rounddown_pow_of_two(pdata-&gt;record_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pdata-&gt;console_size &amp;&amp; !is_po=
wer_of_2(pdata-&gt;console_size))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;consol=
e_size =3D rounddown_pow_of_two(pdata-&gt;console_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pdata-&gt;event_size &amp;&amp; !is_power_of_=
2(pdata-&gt;event_size))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;event_size =
=3D rounddown_pow_of_two(pdata-&gt;event_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pdata-&gt;ftrace_size &amp;&amp; !is_pow=
er_of_2(pdata-&gt;ftrace_size))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;ftrace=
_size =3D rounddown_pow_of_two(pdata-&gt;ftrace_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pdata-&gt;pmsg_size &amp;&amp; !is_power=
_of_2(pdata-&gt;pmsg_size))<br>
&gt; @@ -767,6 +792,7 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;memtype =3D pdata-&gt;mem_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;record_size =3D pdata-&gt;record_siz=
e;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;console_size =3D pdata-&gt;console_s=
ize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cxt-&gt;event_size =3D pdata-&gt;event_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;ftrace_size =3D pdata-&gt;ftrace_siz=
e;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pmsg_size =3D pdata-&gt;pmsg_size;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;dump_oops =3D pdata-&gt;dump_oops;<b=
r>
&gt; @@ -775,8 +801,8 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0paddr =3D cxt-&gt;phys_addr;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dump_mem_sz =3D cxt-&gt;size - cxt-&gt;console_si=
ze - cxt-&gt;ftrace_size<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- cxt-&gt;pmsg_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dump_mem_sz =3D cxt-&gt;size - cxt-&gt;console_si=
ze - cxt-&gt;event_size<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- cxt-&gt;ftrace_size - cxt-&gt;pmsg_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D ramoops_init_przs(&quot;dump&quot;, =
dev, cxt, &amp;cxt-&gt;dprzs, &amp;paddr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump_mem_sz, cxt-&gt;record_size,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;cxt-&gt;max_dump_cnt, 0, 0);<=
br>
&gt; @@ -788,6 +814,11 @@ static int ramoops_probe(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_init_c=
prz;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D ramoops_init_prz(&quot;event&quot;, dev, =
cxt, &amp;cxt-&gt;eprz, &amp;paddr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxt-&gt;event_size, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_init_eprz;<=
br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;max_ftrace_cnt =3D (cxt-&gt;flags &a=
mp; RAMOOPS_FLAG_FTRACE_PER_CPU)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? nr_cpu_ids<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 1;<br>
&gt; @@ -825,6 +856,8 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pstore.flags =3D PSTORE_FLAGS_DMESG;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cxt-&gt;console_size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pstore.f=
lags |=3D PSTORE_FLAGS_CONSOLE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cxt-&gt;event_size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pstore.flags =
|=3D PSTORE_FLAGS_EVENT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cxt-&gt;ftrace_size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pstore.f=
lags |=3D PSTORE_FLAGS_FTRACE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cxt-&gt;pmsg_size)<br>
&gt; @@ -845,6 +878,7 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0record_size =3D pdata-&gt;record_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dump_oops =3D pdata-&gt;dump_oops;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ramoops_console_size =3D pdata-&gt;console_s=
ize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ramoops_event_size =3D pdata-&gt;event_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ramoops_pmsg_size =3D pdata-&gt;pmsg_size;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ramoops_ftrace_size =3D pdata-&gt;ftrace_siz=
e;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -858,6 +892,8 @@ static int ramoops_probe(struct platform_device *p=
dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(cxt-&gt;pstore.buf);<br>
&gt;=C2=A0 =C2=A0fail_clear:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pstore.bufsize =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0persistent_ram_free(cxt-&gt;eprz);<br>
&gt; +fail_init_eprz:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0persistent_ram_free(cxt-&gt;mprz);<br>
&gt;=C2=A0 =C2=A0fail_init_mprz:<br>
&gt;=C2=A0 =C2=A0fail_init_fprz:<br>
&gt; @@ -877,6 +913,7 @@ static int ramoops_remove(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(cxt-&gt;pstore.buf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cxt-&gt;pstore.bufsize =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0persistent_ram_free(cxt-&gt;eprz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0persistent_ram_free(cxt-&gt;mprz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0persistent_ram_free(cxt-&gt;cprz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ramoops_free_przs(cxt);<br>
&gt; @@ -916,6 +953,7 @@ static void ramoops_register_dummy(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_data-&gt;mem_type =3D mem_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_data-&gt;record_size =3D record_size;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_data-&gt;console_size =3D ramoops_cons=
ole_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dummy_data-&gt;event_size =3D ramoops_event_size;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_data-&gt;ftrace_size =3D ramoops_ftrac=
e_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_data-&gt;pmsg_size =3D ramoops_pmsg_si=
ze;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dummy_data-&gt;dump_oops =3D dump_oops;<br>
&gt; diff --git a/include/linux/pstore.h b/include/linux/pstore.h<br>
&gt; index a15bc4d48752..c31bb9567b4a 100644<br>
&gt; --- a/include/linux/pstore.h<br>
&gt; +++ b/include/linux/pstore.h<br>
&gt; @@ -44,6 +44,7 @@ enum pstore_type_id {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PSTORE_TYPE_PPC_COMMON=C2=A0 =3D 6,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PSTORE_TYPE_PMSG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 7,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PSTORE_TYPE_PPC_OPAL=C2=A0 =C2=A0 =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PSTORE_TYPE_EVENT=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 9=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PSTORE_TYPE_UNKNOWN=C2=A0 =C2=A0 =C2=A0=3D 2=
55<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -193,6 +194,7 @@ struct pstore_info {<br>
&gt;=C2=A0 =C2=A0#define PSTORE_FLAGS_CONSOLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1=
 &lt;&lt; 1)<br>
&gt;=C2=A0 =C2=A0#define PSTORE_FLAGS_FTRACE (1 &lt;&lt; 2)<br>
&gt;=C2=A0 =C2=A0#define PSTORE_FLAGS_PMSG=C2=A0 =C2=A0(1 &lt;&lt; 3)<br>
&gt; +#define PSTORE_FLAGS_EVENT=C2=A0 =C2=A0(1 &lt;&lt; 4)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0extern int pstore_register(struct pstore_info *);<br>
&gt;=C2=A0 =C2=A0extern void pstore_unregister(struct pstore_info *);<br>
&gt; diff --git a/include/linux/pstore_ram.h b/include/linux/pstore_ram.h<b=
r>
&gt; index e6d226464838..f01055c6cc40 100644<br>
&gt; --- a/include/linux/pstore_ram.h<br>
&gt; +++ b/include/linux/pstore_ram.h<br>
&gt; @@ -95,6 +95,7 @@ struct ramoops_platform_data {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 mem_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0record_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0console_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0event_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0ftrace_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0pmsg_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dump_oops;<br>
&gt; <br>
<br>
Hi,<br>
<br>
Anyone here?<br>
</blockquote></div></div></div>

--0000000000001a1fb60575fd68dc--
