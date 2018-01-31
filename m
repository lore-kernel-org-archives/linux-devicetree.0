From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v2 3/4] media: ov2685: add support for OV2685 sensor
Date: Wed, 31 Jan 2018 22:44:15 +0200
Message-ID: <20180131204415.62n7wvye5fqp6ml6@valkosipuli.retiisi.org.uk>
References: <1514534905-21393-1-git-send-email-zhengsq@rock-chips.com>
 <1514534905-21393-3-git-send-email-zhengsq@rock-chips.com>
 <20180103114324.za6bmg2rxuygawi4@valkosipuli.retiisi.org.uk>
 <8f60a7f8-8471-85e8-70d3-520701edc092@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8f60a7f8-8471-85e8-70d3-520701edc092-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shunqian,

On Fri, Jan 12, 2018 at 10:30:57AM +0800, Shunqian Zheng wrote:
> Hi Sakari,
> 
> 
> On 2018年01月03日 19:43, Sakari Ailus wrote:
> > > +static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
> > > +{
> > > +	struct ov2685 *ov2685 = to_ov2685(sd);
> > > +	struct i2c_client *client = ov2685->client;
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&ov2685->mutex);
> > > +
> > > +	on = !!on;
> > > +	if (on == ov2685->streaming)
> > > +		goto unlock_and_return;
> > > +
> > > +	if (on) {
> > > +		/* In case these controls are set before streaming */
> > > +		ov2685_set_exposure(ov2685, ov2685->exposure->val);
> > > +		ov2685_set_gain(ov2685, ov2685->anal_gain->val);
> > > +		ov2685_set_vts(ov2685, ov2685->vblank->val);
> > > +		ov2685_enable_test_pattern(ov2685, ov2685->test_pattern->val);
> > You should use __v4l2_ctrl_handler_setup() here. Or put that to the
> > driver's runtime_resume function. That actually might be better.
> The v3 put __v4l2_ctrl_handler_setup() to the runtime_resume callback. But
> ov2685_s_stream()
>    -> pm_runtime_get_sync()
>        -> ov2685_runtime_resume()
>             -> __v4l2_ctrl_handler_setup()
>                 -> pm_runtime_get_if_in_use(), always <= 0 because
> dev->power.runtime_status != RPM_ACTIVE.
> 
> Seems like  __v4l2_ctrl_handler_setup() has to be in ov2685_s_stream().

Right, indeed. Well spotted.

The smiapp driver uses a device specific variable for the purpose, thus I
missed this. Other drivers apply the controls while streaming on.

> 
> Thanks
> > > +
> > > +		ret = ov2685_write_reg(client, REG_SC_CTRL_MODE,
> > > +				OV2685_REG_VALUE_08BIT, SC_CTRL_MODE_STREAMING);
> > > +		if (ret)
> > > +			goto unlock_and_return;
> > > +	} else {
> > > +		ret = ov2685_write_reg(client, REG_SC_CTRL_MODE,
> > > +				OV2685_REG_VALUE_08BIT, SC_CTRL_MODE_STANDBY);
> > > +		if (ret)
> > > +			goto unlock_and_return;
> > > +	}
> > > +
> > > +	ov2685->streaming = on;
> > > +
> > > +unlock_and_return:
> > > +	mutex_unlock(&ov2685->mutex);
> > > +	return ret;
> > > +}
> 

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
