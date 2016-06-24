From: Horng-Shyang Liao <hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 2/3] CMDQ: Mediatek CMDQ driver
Date: Fri, 24 Jun 2016 19:39:31 +0800
Message-ID: <1466768371.817.9.camel@mtksdaap41>
References: <1464578397-29743-1-git-send-email-hs.liao@mediatek.com>
	 <1464578397-29743-3-git-send-email-hs.liao@mediatek.com>
	 <1466419311.27959.12.camel@mtksdaap41>
	 <1466421720.1918.11.camel@mtksdaap41> <1466474580.6214.29.camel@mtksdaap41>
	 <1466495171.8045.27.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466495171.8045.27.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cawa cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Damon Chu <damon.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Josh-YC Liu <josh-yc.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Glory Hung <glory.hung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jiaguang Zhang <jiaguang.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dennis-YC Hsieh <dennis-yc.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Monica Wang <monica.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, hs.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-06-21 at 15:46 +0800, Horng-Shyang Liao wrote:
> On Tue, 2016-06-21 at 10:03 +0800, CK Hu wrote:
> > On Mon, 2016-06-20 at 19:22 +0800, Horng-Shyang Liao wrote:
> > > On Mon, 2016-06-20 at 18:41 +0800, CK Hu wrote:
> > > > [Snip...]
> > > > 
> > > > > +
> > > > > +static int cmdq_eng_get_thread(u64 flag)
> > > > > +{
> > > > > +	if (flag & BIT_ULL(CMDQ_ENG_DISP_DSI0))
> > > > > +		return CMDQ_THR_DISP_MAIN_IDX;
> > > > > +	else if (flag & BIT_ULL(CMDQ_ENG_DISP_DPI0))
> > > > > +		return CMDQ_THR_DISP_SUB_IDX;
> > > > > +	else
> > > > > +		return CMDQ_THR_DISP_MISC_IDX;
> > > > > +}
> > > > 
> > > > I think cmdq should not have knowledge of client. These statement show
> > > > that cmdq know that DSI0-tasks is different with DPI0-tasks. I propose
> > > > the 'session' to replace engine flag. For example, main display create
> > > > one cmdq_session and external display create another cmdq_session. For
> > > > client driver, every tasks created by main display is bound to main
> > > > display session. For cmdq driver, it should dynamically bind a session
> > > > to a HW thread, and then dispatch tasks of this session to this HW
> > > > thread. After HW thread run out of tasks of this session, detach this
> > > > session with this thread.
> > > > For the problem of remove wfe cmd, I think a session can have a property
> > > > of merge_wfe_cmd. For display session, session->merge_wfe_cmd = true.
> > > > For other client, it's false.
> > > 
> > > Hi CK,
> > > 
> > > I think your suggestion is similar to CMDQ 'scenarios',
> > > which was removed from CMDQ v2.
> > > 
> > > Daniel suggests to use engine flags instead of scenarios.
> > > Quote from https://patchwork.kernel.org/patch/8068311/ .
> > > 'Instead of encoding policy (these arbitrary "scenarios"), perhaps the
> > >  cmdq driver should just provide these flag bits, and the display
> > >  subsystem can use them to build the "flag" parameter itself.
> > > 
> > >  After all, the exact configuration of mmsys components is somewhat
> > >  flexible.'
> > > 
> > > Therefore, it would be better to discuss with Daniel before we change
> > > it.
> > > 
> > > 
> > > Hi Daniel,
> > > 
> > > Do you think we should use scenarios or sessions instead of flags?
> > > 
> > > Thanks,
> > > HS
> > > 
> > 
> > Hi, HS:
> > 
> > 'session' is not similar to 'scenarios'.
> > 
> > In 'scenarios' mechanism, client bind a task with scenarios and send to
> > cmdq. Cmdq transfer scenarios to engine flag, and use engine flag to
> > dispatch task to HW thread.
> > 
> > 
> > In 'engine flag' mechanism, proposed by Daniel, client bind a task
> > directly with engine flag. Cmdq directly use engine flag to dispatch
> > task to HW thread without any translation.
> > 
> > But neither 'scenarios' mechanism nor 'engine flag' mechanism get rid of
> > engine flag, which make cmdq have knowledge of client.
> > 
> > In 'session' mechanism, there is no engine flag any more. Client bind
> > time-sequential tasks to the same session and tasks in different session
> > can execute parallelly. One thing cmdq need to know is to dispatch tasks
> > with the same session to the same HW thread, so cmdq does not have any
> > knowledge of client.
> > 
> > Daniel focus on reduce translating scenarios to engine flag. I think
> > 'session' mechanism does not conflict with his opinion because we does
> > not translate 'session' to engine flag. Therefore, I think 'session' is
> > the best of these three mechanism.
> > 
> > Regards,
> > CK
> 
> Hi CK,
> 
> 'Session' looks like a group of options for CMDQ.
> CMDQ driver can just follow the options to run its flow,
> and doesn't need to know its client(s).
> 
> We don't have many options now, but it has good flexibility to extend
> for future requirements.
> 
> I will add it in next version.
> 
> Thanks,
> HS

Hi CK,

I think session is very similar to mailbox channel.
We can treat session's parameters as channel's arguments in device tree.
Linking session to GCE thread is also just like linking channel to GCE
thread.
Because I will use mailbox framework in CMDQ v9, we can use mailbox
channel instead of session.
What do you think?

Thanks,
HS

> > > > Here is the sample code to create cmdq_rec with session.
> > > > 
> > > > merge_wfe_cmd = true;
> > > > cmdq_session_create(merge_wfe_cmd, &primary_display_session);
> > > > cmdq_rec_create(dev, primary_display_session, &rec);
> > > > 
> > > > 
> > > > Therefore, the below definition can be removed.
> > > > 
> > > > > +
> > > > > +enum cmdq_eng {
> > > > > +	CMDQ_ENG_DISP_AAL,
> > > > > +	CMDQ_ENG_DISP_COLOR0,
> > > > > +	CMDQ_ENG_DISP_COLOR1,
> > > > > +	CMDQ_ENG_DISP_DPI0,
> > > > > +	CMDQ_ENG_DISP_DSI0,
> > > > > +	CMDQ_ENG_DISP_DSI1,
> > > > > +	CMDQ_ENG_DISP_GAMMA,
> > > > > +	CMDQ_ENG_DISP_OD,
> > > > > +	CMDQ_ENG_DISP_OVL0,
> > > > > +	CMDQ_ENG_DISP_OVL1,
> > > > > +	CMDQ_ENG_DISP_PWM0,
> > > > > +	CMDQ_ENG_DISP_PWM1,
> > > > > +	CMDQ_ENG_DISP_RDMA0,
> > > > > +	CMDQ_ENG_DISP_RDMA1,
> > > > > +	CMDQ_ENG_DISP_RDMA2,
> > > > > +	CMDQ_ENG_DISP_UFOE,
> > > > > +	CMDQ_ENG_DISP_WDMA0,
> > > > > +	CMDQ_ENG_DISP_WDMA1,
> > > > > +	CMDQ_ENG_MAX,
> > > > > +};
> > > > > +
> > > > 
> > > > 
> > > > Regards,
> > > > CK


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
