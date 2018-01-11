From: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 10/10] drm: xlnx: zynqmp: Add debugfs
Date: Thu, 11 Jan 2018 16:57:24 +0000
Message-ID: <BY1PR0201MB10005E8514713CB902F99CFDD6160@BY1PR0201MB1000.namprd02.prod.outlook.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
 <1515117959-18068-11-git-send-email-hyun.kwon@xilinx.com>
 <20180109095425.GJ26573@phenom.ffwll.local>
 <BY1PR0201MB10001A1C38398BFBAEC56D39D6160@BY1PR0201MB1000.namprd02.prod.outlook.com>
 <20180111080605.GB13066@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111080605.GB13066-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejas Upadhyay <TEJASU-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

> -----Original Message-----
> From: Daniel Vetter [mailto:daniel.vetter-/w4YWyX8dFk@public.gmane.org] On Behalf Of Daniel V=
etter
> Sent: Thursday, January 11, 2018 12:06 AM
> To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>; dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Tejas Upadhyay <TEJASU-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Michal
> Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH 10/10] drm: xlnx: zynqmp: Add debugfs
>=20
> On Thu, Jan 11, 2018 at 02:05:31AM +0000, Hyun Kwon wrote:
> > Hi Daniel,
> >
> > > -----Original Message-----
> > > From: Daniel Vetter [mailto:daniel.vetter-/w4YWyX8dFk@public.gmane.org] On Behalf Of Dani=
el
> > > Vetter
> > > Sent: Tuesday, January 09, 2018 1:54 AM
> > > To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Teja=
s
> > > Upadhyay <TEJASU-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > Subject: Re: [PATCH 10/10] drm: xlnx: zynqmp: Add debugfs
> > >
> > > On Thu, Jan 04, 2018 at 06:05:59PM -0800, Hyun Kwon wrote:
> > > > Debugfs can be used to exploit some specific setting. Main purpose
> > > > is for testing and debug diagnostic.
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejasu-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > > Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > >
> > > Hm, not sure what's the use, it seems to just be for setting/getting
> > > your driver-private properties. Usually people use modetest and simil=
ar
> > > tools, but if there's demand for setting properties in debugfs (we al=
ready
> > > have all the infrastructure for dumping the entire kms state, see the
> > > various atomic_print_state callbacks) I think that should be done wit=
h
> > > generic drm code.
> > >
> > > I'd drop this patch for now (if there's no other reason for it).
> >
> > Thanks for the input. It'd be helpful, for my own understanding, if thi=
s
> > can be elaborated a little more. We are using standard tools as well as
> > custom script/tool, but some specific properties / controls are hard to
> > be executed with modetest only unless we change the entire set up /
> > design between each run. The debugfs is used to run all (or as much as
> > possible) properties in a single run, and from what I understand, that
> > doesn't violate intended debugfs usage as long as it's not treated as a
> > stable ABI. The intention is to help isolate issues and enhance the
> > diagnostics. I agree, in the long term, this kind of stuff should be
> > handled in generic way, but would it be still reasonable to keep it
> > driver specific in the meantime?
>=20
> Well since the property stuff needs more work anyway I think we could do
> it properly (for upstream) from the start.
>=20
> What exactly is the issue with modetest? For intel we don't use it, we do
> all our testing using the igt gpu tests:
>=20
> https://cgit.freedesktop.org/drm/igt
>=20
> A big pile of these tests also run on non-intel (and we're definitely ver=
y
> much appreciating such work). But if you want just a bit of scripting,
> modetest should be able to do it. If not I guess we'll need patches.

For example, for DisplayPort, there are lane count / link rate, and the max=
imum values depend on the board or connected monitors. We are enforcing tho=
se values manually through debugfs before running tests. We will think how =
to remove the driver specific debugfs, and we can drop it for now. I'll tak=
e a look at the repo. Thanks for the pointer.

Thanks,
-hyun

> -Daniel
> >
> > Thanks,
> > -hyun
> >
> > > -Daniel
> > >
> > > > ---
> > > >  drivers/gpu/drm/xlnx/Kconfig       |  21 +++
> > > >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 326
> > > +++++++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xlnx/zynqmp_dp.c   | 304
> > > ++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 651 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kc=
onfig
> > > > index 7c5529c..befce0f 100644
> > > > --- a/drivers/gpu/drm/xlnx/Kconfig
> > > > +++ b/drivers/gpu/drm/xlnx/Kconfig
> > > > @@ -21,3 +21,24 @@ config DRM_ZYNQMP_DPSUB
> > > >  	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
> > > >  	  subsystem. The driver provides the kernel mode setting
> > > >  	  functionlaities for ZynqMP DP subsystem.
> > > > +
> > > > +config DRM_ZYNQMP_DISP_DEBUG_FS
> > > > +	bool "ZynqMP Display debugfs"
> > > > +	depends on DEBUG_FS && DRM_ZYNQMP_DPSUB
> > > > +	select DRM_ZYNQMP_DP_DEBUG_FS
> > > > +	help
> > > > +	  Enable the debugfs code for DP Sub driver. The debugfs code
> > > > +	  enables debugging or testing related features. It exposes some
> > > > +	  low level controls to the user space to help testing automation=
,
> > > > +	  as well as can enable additional diagnostic or statistical
> > > > +	  information.
> > > > +
> > > > +config DRM_ZYNQMP_DP_DEBUG_FS
> > > > +	bool "ZynqMP DP debugfs"
> > > > +	depends on DEBUG_FS && DRM_ZYNQMP_DPSUB
> > > > +	help
> > > > +	  Enable the debugfs code for DP driver. The debugfs code
> > > > +	  enables debugging or testing related features. It exposes some
> > > > +	  low level controls to the user space to help testing automation=
,
> > > > +	  as well as can enable additional diagnostic or statistical
> > > > +	  information.
> > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > index 68f829c..9fe6d49 100644
> > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > @@ -17,6 +17,7 @@
> > > >  #include <drm/drm_plane_helper.h>
> > > >
> > > >  #include <linux/clk.h>
> > > > +#include <linux/debugfs.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dmaengine.h>
> > > >  #include <linux/interrupt.h>
> > > > @@ -508,6 +509,325 @@ static void zynqmp_disp_set(void __iomem
> > > *base, int offset, u32 set)
> > > >  	zynqmp_disp_write(base, offset, zynqmp_disp_read(base, offset) |
> > > set);
> > > >  }
> > > >
> > > > +#ifdef CONFIG_DRM_ZYNQMP_DISP_DEBUG_FS
> > > > +
> > > > +#define ZYNQMP_DISP_DEBUGFS_READ_MAX_SIZE	32UL
> > > > +#define ZYNQMP_DISP_DEBUGFS_MAX_BG_COLOR_VAL	0xFFF
> > > > +#define IN_RANGE(x, min, max) ({		\
> > > > +		typeof(x) _x =3D (x);		\
> > > > +		_x >=3D (min) && _x <=3D (max); })
> > > > +
> > > > +/* Match xilinx_dp_testcases vs dp_debugfs_reqs[] entry */
> > > > +enum zynqmp_disp_testcases {
> > > > +	DP_SUB_TC_BG_COLOR,
> > > > +	DP_SUB_TC_OUTPUT_FMT,
> > > > +	DP_SUB_TC_NONE
> > > > +};
> > > > +
> > > > +struct zynqmp_disp_debugfs {
> > > > +	enum zynqmp_disp_testcases testcase;
> > > > +	u16 r_value;
> > > > +	u16 g_value;
> > > > +	u16 b_value;
> > > > +	u32 output_fmt;
> > > > +	struct zynqmp_disp *zynqmp_disp;
> > > > +};
> > > > +
> > > > +static struct dentry *zynqmp_disp_debugfs_dir;
> > > > +struct zynqmp_disp_debugfs disp_debugfs;
> > > > +struct zynqmp_disp_debugfs_request {
> > > > +	const char *req;
> > > > +	enum zynqmp_disp_testcases tc;
> > > > +	ssize_t (*read_handler)(char **kern_buff);
> > > > +	ssize_t (*write_handler)(char **cmd);
> > > > +};
> > > > +
> > > > +static void
> > > > +zynqmp_disp_set_output_fmt(struct zynqmp_disp *disp, unsigned int
> > > id);
> > > > +static s64 zynqmp_disp_debugfs_argument_value(char *arg)
> > > > +{
> > > > +	s64 value;
> > > > +
> > > > +	if (!arg)
> > > > +		return -1;
> > > > +
> > > > +	if (!kstrtos64(arg, 0, &value))
> > > > +		return value;
> > > > +
> > > > +	return -1;
> > > > +}
> > > > +
> > > > +static ssize_t
> > > > +zynqmp_disp_debugfs_background_color_write(char **disp_test_arg)
> > > > +{
> > > > +	char *r_color, *g_color, *b_color;
> > > > +	s64 r_val, g_val, b_val;
> > > > +
> > > > +	r_color =3D strsep(disp_test_arg, " ");
> > > > +	g_color =3D strsep(disp_test_arg, " ");
> > > > +	b_color =3D strsep(disp_test_arg, " ");
> > > > +
> > > > +	/* char * to int conversion */
> > > > +	r_val =3D zynqmp_disp_debugfs_argument_value(r_color);
> > > > +	g_val =3D zynqmp_disp_debugfs_argument_value(g_color);
> > > > +	b_val =3D zynqmp_disp_debugfs_argument_value(b_color);
> > > > +
> > > > +	if (!(IN_RANGE(r_val, 0,
> > > ZYNQMP_DISP_DEBUGFS_MAX_BG_COLOR_VAL) &&
> > > > +	      IN_RANGE(g_val, 0,
> > > ZYNQMP_DISP_DEBUGFS_MAX_BG_COLOR_VAL) &&
> > > > +	      IN_RANGE(b_val, 0,
> > > ZYNQMP_DISP_DEBUGFS_MAX_BG_COLOR_VAL)))
> > > > +		return -EINVAL;
> > > > +
> > > > +	disp_debugfs.r_value =3D r_val;
> > > > +	disp_debugfs.g_value =3D g_val;
> > > > +	disp_debugfs.b_value =3D b_val;
> > > > +
> > > > +	disp_debugfs.testcase =3D DP_SUB_TC_BG_COLOR;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static ssize_t
> > > > +zynqmp_disp_debugfs_output_display_format_write(char
> > > **disp_test_arg)
> > > > +{
> > > > +	char *output_format;
> > > > +	struct zynqmp_disp *disp =3D disp_debugfs.zynqmp_disp;
> > > > +
> > > > +	/* Read the value from a user value */
> > > > +	output_format =3D strsep(disp_test_arg, " ");
> > > > +	if (strncmp(output_format, "rgb", 3) =3D=3D 0) {
> > > > +		disp_debugfs.output_fmt =3D
> > > > +			ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_RGB;
> > > > +	} else if (strncmp(output_format, "ycbcr444", 8) =3D=3D 0) {
> > > > +		disp_debugfs.output_fmt =3D
> > > > +
> > > 	ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YCBCR444;
> > > > +	} else if (strncmp(output_format, "ycbcr422", 8) =3D=3D 0) {
> > > > +		disp_debugfs.output_fmt =3D
> > > > +
> > > 	ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YCBCR422;
> > > > +	} else if (strncmp(output_format, "yonly", 5) =3D=3D 0) {
> > > > +		disp_debugfs.output_fmt =3D
> > > > +
> > > 	ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YONLY;
> > > > +	} else {
> > > > +		dev_err(disp->dev, "Invalid output format\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	disp_debugfs.testcase =3D DP_SUB_TC_OUTPUT_FMT;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static ssize_t
> > > > +zynqmp_disp_debugfs_output_display_format_read(char **kern_buff)
> > > > +{
> > > > +	size_t out_str_len;
> > > > +
> > > > +	disp_debugfs.testcase =3D DP_SUB_TC_NONE;
> > > > +	disp_debugfs.output_fmt =3D 0;
> > > > +
> > > > +	out_str_len =3D strlen("Success");
> > > > +	out_str_len =3D min(ZYNQMP_DISP_DEBUGFS_READ_MAX_SIZE,
> > > out_str_len);
> > > > +	snprintf(*kern_buff, out_str_len, "%s", "Success");
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static ssize_t
> > > > +zynqmp_disp_debugfs_background_color_read(char **kern_buff)
> > > > +{
> > > > +	size_t out_str_len;
> > > > +
> > > > +	disp_debugfs.testcase =3D DP_SUB_TC_NONE;
> > > > +	disp_debugfs.r_value =3D 0;
> > > > +	disp_debugfs.g_value =3D 0;
> > > > +	disp_debugfs.b_value =3D 0;
> > > > +
> > > > +	out_str_len =3D strlen("Success");
> > > > +	out_str_len =3D min(ZYNQMP_DISP_DEBUGFS_READ_MAX_SIZE,
> > > out_str_len);
> > > > +	snprintf(*kern_buff, out_str_len, "%s", "Success");
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/* Match xilinx_dp_testcases vs dp_debugfs_reqs[] entry */
> > > > +struct zynqmp_disp_debugfs_request disp_debugfs_reqs[] =3D {
> > > > +	{"BACKGROUND_COLOR", DP_SUB_TC_BG_COLOR,
> > > > +		zynqmp_disp_debugfs_background_color_read,
> > > > +		zynqmp_disp_debugfs_background_color_write},
> > > > +	{"OUTPUT_DISPLAY_FORMAT", DP_SUB_TC_OUTPUT_FMT,
> > > > +		zynqmp_disp_debugfs_output_display_format_read,
> > > > +		zynqmp_disp_debugfs_output_display_format_write},
> > > > +};
> > > > +
> > > > +static ssize_t
> > > > +zynqmp_disp_debugfs_write(struct file *f, const char __user *buf,
> > > > +			  size_t size, loff_t *pos)
> > > > +{
> > > > +	char *kern_buff, *disp_test_req, *kern_buff_start;
> > > > +	int ret;
> > > > +	unsigned int i;
> > > > +
> > > > +	if (*pos !=3D 0 || size <=3D 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (disp_debugfs.testcase !=3D DP_SUB_TC_NONE)
> > > > +		return -EBUSY;
> > > > +
> > > > +	kern_buff =3D kzalloc(size, GFP_KERNEL);
> > > > +	if (!kern_buff)
> > > > +		return -ENOMEM;
> > > > +	kern_buff_start =3D kern_buff;
> > > > +
> > > > +	ret =3D strncpy_from_user(kern_buff, buf, size);
> > > > +	if (ret < 0) {
> > > > +		kfree(kern_buff_start);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	/* Read the testcase name and argument from a user request */
> > > > +	disp_test_req =3D strsep(&kern_buff, " ");
> > > > +
> > > > +	for (i =3D 0; i < ARRAY_SIZE(disp_debugfs_reqs); i++) {
> > > > +		if (!strcasecmp(disp_test_req, disp_debugfs_reqs[i].req))
> > > > +			if (!disp_debugfs_reqs[i].write_handler(&kern_buff))
> > > {
> > > > +				kfree(kern_buff_start);
> > > > +				return size;
> > > > +			}
> > > > +	}
> > > > +	kfree(kern_buff_start);
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > > +static ssize_t zynqmp_disp_debugfs_read(struct file *f, char __use=
r *buf,
> > > > +					size_t size, loff_t *pos)
> > > > +{
> > > > +	char *kern_buff =3D NULL;
> > > > +	size_t kern_buff_len, out_str_len;
> > > > +	enum zynqmp_disp_testcases tc;
> > > > +	int ret;
> > > > +
> > > > +	if (size <=3D 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (*pos !=3D 0)
> > > > +		return 0;
> > > > +
> > > > +	kern_buff =3D kzalloc(ZYNQMP_DISP_DEBUGFS_READ_MAX_SIZE,
> > > GFP_KERNEL);
> > > > +	if (!kern_buff) {
> > > > +		disp_debugfs.testcase =3D DP_SUB_TC_NONE;
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	tc =3D disp_debugfs.testcase;
> > > > +	if (tc =3D=3D DP_SUB_TC_NONE) {
> > > > +		out_str_len =3D strlen("No testcase executed");
> > > > +		out_str_len =3D
> > > min(ZYNQMP_DISP_DEBUGFS_READ_MAX_SIZE,
> > > > +				  out_str_len);
> > > > +		snprintf(kern_buff, out_str_len, "%s", "No testcase
> > > executed");
> > > > +	} else {
> > > > +		ret =3D disp_debugfs_reqs[tc].read_handler(&kern_buff);
> > > > +		if (ret) {
> > > > +			kfree(kern_buff);
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	kern_buff_len =3D strlen(kern_buff);
> > > > +	size =3D min(size, kern_buff_len);
> > > > +
> > > > +	ret =3D copy_to_user(buf, kern_buff, size);
> > > > +
> > > > +	kfree(kern_buff);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	*pos =3D size + 1;
> > > > +	return size;
> > > > +}
> > > > +
> > > > +static const struct file_operations fops_zynqmp_disp_dbgfs =3D {
> > > > +	.owner =3D THIS_MODULE,
> > > > +	.read =3D zynqmp_disp_debugfs_read,
> > > > +	.write =3D zynqmp_disp_debugfs_write,
> > > > +};
> > > > +
> > > > +static int zynqmp_disp_debugfs_init(struct zynqmp_disp *disp)
> > > > +{
> > > > +	int err;
> > > > +	struct dentry *zynqmp_disp_debugfs_file;
> > > > +
> > > > +	disp_debugfs.testcase =3D DP_SUB_TC_NONE;
> > > > +	disp_debugfs.zynqmp_disp =3D disp;
> > > > +
> > > > +	zynqmp_disp_debugfs_dir =3D debugfs_create_dir("disp", NULL);
> > > > +	if (!zynqmp_disp_debugfs_dir) {
> > > > +		dev_err(disp->dev, "debugfs_create_dir failed\n");
> > > > +		return -ENODEV;
> > > > +	}
> > > > +
> > > > +	zynqmp_disp_debugfs_file =3D
> > > > +		debugfs_create_file("testcase", 0444,
> > > > +				    zynqmp_disp_debugfs_dir, NULL,
> > > > +				    &fops_zynqmp_disp_dbgfs);
> > > > +	if (!zynqmp_disp_debugfs_file) {
> > > > +		dev_err(disp->dev, "debugfs_create_file testcase failed\n");
> > > > +		err =3D -ENODEV;
> > > > +		goto err_dbgfs;
> > > > +	}
> > > > +	return 0;
> > > > +
> > > > +err_dbgfs:
> > > > +	debugfs_remove_recursive(zynqmp_disp_debugfs_dir);
> > > > +	zynqmp_disp_debugfs_dir =3D NULL;
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static void zynqmp_disp_debugfs_exit(struct zynqmp_disp *disp)
> > > > +{
> > > > +	debugfs_remove_recursive(zynqmp_disp_debugfs_dir);
> > > > +	zynqmp_disp_debugfs_dir =3D NULL;
> > > > +}
> > > > +
> > > > +static void zynqmp_disp_debugfs_bg_color(struct zynqmp_disp *disp)
> > > > +{
> > > > +	if (disp_debugfs.testcase =3D=3D DP_SUB_TC_BG_COLOR) {
> > > > +		zynqmp_disp_write(disp->blend.base,
> > > > +				  ZYNQMP_DISP_V_BLEND_BG_CLR_0,
> > > > +				  disp_debugfs.r_value);
> > > > +		zynqmp_disp_write(disp->blend.base,
> > > > +				  ZYNQMP_DISP_V_BLEND_BG_CLR_1,
> > > > +				  disp_debugfs.g_value);
> > > > +		zynqmp_disp_write(disp->blend.base,
> > > > +				  ZYNQMP_DISP_V_BLEND_BG_CLR_2,
> > > > +				  disp_debugfs.b_value);
> > > > +	}
> > > > +}
> > > > +
> > > > +static void
> > > > +zynqmp_disp_set_debugfs_output_fmt(struct zynqmp_disp *disp)
> > > > +{
> > > > +	if (disp_debugfs.testcase =3D=3D DP_SUB_TC_OUTPUT_FMT)
> > > > +		zynqmp_disp_set_output_fmt(disp,
> > > disp_debugfs.output_fmt);
> > > > +}
> > > > +#else
> > > > +static void zynqmp_disp_debugfs_exit(struct zynqmp_disp *disp)
> > > > +{
> > > > +}
> > > > +
> > > > +static int zynqmp_disp_debugfs_init(struct zynqmp_disp *disp)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void zynqmp_disp_debugfs_bg_color(struct zynqmp_disp *disp)
> > > > +{
> > > > +}
> > > > +
> > > > +static void
> > > > +zynqmp_disp_set_debugfs_output_fmt(struct zynqmp_disp *disp)
> > > > +{
> > > > +}
> > > > +#endif /* CONFIG_DP_DEBUG_FS */
> > > > +
> > > >  /*
> > > >   * Clock functions
> > > >   */
> > > > @@ -597,6 +917,8 @@ zynqmp_disp_blend_set_output_fmt(struct
> > > zynqmp_disp_blend *blend, u32 fmt)
> > > >  	u32 *offsets;
> > > >  	u32 offset, i;
> > > >
> > > > +	if (fmt =3D=3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YCBCR422)
> > > > +		fmt |=3D
> > > ZYNQMP_DISP_V_BLEND_OUTPUT_EN_DOWNSAMPLE;
> > > >  	zynqmp_disp_write(blend->base,
> > > ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT, fmt);
> > > >  	if (fmt =3D=3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_RGB) {
> > > >  		coeffs =3D reset_coeffs;
> > > > @@ -1941,6 +2263,7 @@ static void zynqmp_disp_set_bg_color(struct
> > > zynqmp_disp *disp,
> > > >  				     u32 c0, u32 c1, u32 c2)
> > > >  {
> > > >  	zynqmp_disp_blend_set_bg_color(&disp->blend, c0, c1, c2);
> > > > +	zynqmp_disp_debugfs_bg_color(disp);
> > > >  }
> > > >
> > > >  /**
> > > > @@ -2572,6 +2895,7 @@ zynqmp_disp_crtc_atomic_enable(struct
> > > drm_crtc *crtc,
> > > >  		return;
> > > >  	}
> > > >  	zynqmp_disp_set_output_fmt(disp, disp->color);
> > > > +	zynqmp_disp_set_debugfs_output_fmt(disp);
> > > >  	zynqmp_disp_set_bg_color(disp, disp->bg_c0, disp->bg_c1, disp-
> > > >bg_c2);
> > > >  	zynqmp_disp_enable(disp);
> > > >  	/* Delay of 3 vblank intervals for timing gen to be stable */
> > > > @@ -2911,6 +3235,7 @@ int zynqmp_disp_probe(struct
> > > platform_device *pdev)
> > > >  	ret =3D zynqmp_disp_layer_create(disp);
> > > >  	if (ret)
> > > >  		goto error_aclk;
> > > > +	zynqmp_disp_debugfs_init(disp);
> > > >
> > > >  	return 0;
> > > >
> > > > @@ -2924,6 +3249,7 @@ int zynqmp_disp_remove(struct
> > > platform_device *pdev)
> > > >  	struct zynqmp_dpsub *dpsub =3D platform_get_drvdata(pdev);
> > > >  	struct zynqmp_disp *disp =3D dpsub->disp;
> > > >
> > > > +	zynqmp_disp_debugfs_exit(disp);
> > > >  	zynqmp_disp_layer_destroy(disp);
> > > >  	if (disp->audclk)
> > > >  		zynqmp_disp_clk_disable(disp->audclk, &disp->audclk_en);
> > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > index ce3c7c5..66fbad0 100644
> > > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > @@ -16,6 +16,7 @@
> > > >  #include <drm/drm_dp_helper.h>
> > > >  #include <drm/drm_of.h>
> > > >
> > > > +#include <linux/debugfs.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/module.h>
> > > > @@ -371,6 +372,306 @@ static void zynqmp_dp_set(void __iomem
> > > *base, int offset, u32 set)
> > > >  }
> > > >
> > > >  /*
> > > > + * Debugfs functions
> > > > + */
> > > > +
> > > > +#ifdef CONFIG_DRM_ZYNQMP_DP_DEBUG_FS
> > > > +
> > > > +#define ZYNQMP_DP_DEBUGFS_READ_MAX_SIZE	32UL
> > > > +#define ZYNQMP_DP_DEBUGFS_UINT8_MAX_STR	"255"
> > > > +#define IN_RANGE(x, min, max) ({		\
> > > > +		typeof(x) _x =3D (x);		\
> > > > +		_x >=3D (min) && _x <=3D (max); })
> > > > +
> > > > +/* Match zynqmp_dp_testcases vs debugfs_reqs[] entry */
> > > > +enum zynqmp_dp_testcases {
> > > > +	DP_TC_LINK_RATE,
> > > > +	DP_TC_LANE_COUNT,
> > > > +	DP_TC_OUTPUT_FMT,
> > > > +	DP_TC_NONE
> > > > +};
> > > > +
> > > > +struct zynqmp_dp_debugfs {
> > > > +	enum zynqmp_dp_testcases testcase;
> > > > +	u8 link_rate;
> > > > +	u8 lane_cnt;
> > > > +	u8 old_output_fmt;
> > > > +	struct zynqmp_dp *dp;
> > > > +};
> > > > +
> > > > +static struct dentry *zynqmp_dp_debugfs_dir;
> > > > +static struct zynqmp_dp_debugfs dp_debugfs;
> > > > +struct zynqmp_dp_debugfs_request {
> > > > +	const char *req;
> > > > +	enum zynqmp_dp_testcases tc;
> > > > +	ssize_t (*read_handler)(char **kern_buff);
> > > > +	ssize_t (*write_handler)(char **cmd);
> > > > +};
> > > > +
> > > > +static s64 zynqmp_dp_debugfs_argument_value(char *arg)
> > > > +{
> > > > +	s64 value;
> > > > +
> > > > +	if (!arg)
> > > > +		return -1;
> > > > +
> > > > +	if (!kstrtos64(arg, 0, &value))
> > > > +		return value;
> > > > +
> > > > +	return -1;
> > > > +}
> > > > +
> > > > +static ssize_t zynqmp_dp_debugfs_max_linkrate_write(char
> > > **dp_test_arg)
> > > > +{
> > > > +	char *link_rate_arg;
> > > > +	s64 link_rate;
> > > > +
> > > > +	link_rate_arg =3D strsep(dp_test_arg, " ");
> > > > +	link_rate =3D zynqmp_dp_debugfs_argument_value(link_rate_arg);
> > > > +	if (link_rate < 0 || (link_rate !=3D DP_HIGH_BIT_RATE2 &&
> > > > +			      link_rate !=3D DP_HIGH_BIT_RATE &&
> > > > +			      link_rate !=3D DP_REDUCED_BIT_RATE))
> > > > +		return -EINVAL;
> > > > +
> > > > +	dp_debugfs.link_rate =3D drm_dp_link_rate_to_bw_code(link_rate);
> > > > +	dp_debugfs.testcase =3D DP_TC_LINK_RATE;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static ssize_t zynqmp_dp_debugfs_max_lanecnt_write(char
> > > **dp_test_arg)
> > > > +{
> > > > +	char *lane_cnt_arg;
> > > > +	s64 lane_count;
> > > > +
> > > > +	lane_cnt_arg =3D strsep(dp_test_arg, " ");
> > > > +	lane_count =3D zynqmp_dp_debugfs_argument_value(lane_cnt_arg);
> > > > +	if (lane_count < 0 || !IN_RANGE(lane_count, 1,
> > > > +					ZYNQMP_DP_MAX_LANES))
> > > > +		return -EINVAL;
> > > > +
> > > > +	dp_debugfs.lane_cnt =3D lane_count;
> > > > +	dp_debugfs.testcase =3D DP_TC_LANE_COUNT;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static ssize_t zynqmp_dp_debugfs_max_linkrate_read(char **kern_buf=
f)
> > > > +{
> > > > +	struct zynqmp_dp *dp =3D dp_debugfs.dp;
> > > > +	size_t output_str_len;
> > > > +	u8 dpcd_link_bw;
> > > > +	int ret;
> > > > +
> > > > +	dp_debugfs.testcase =3D DP_TC_NONE;
> > > > +	dp_debugfs.link_rate =3D 0;
> > > > +
> > > > +	/* Getting Sink Side Link Rate */
> > > > +	ret =3D drm_dp_dpcd_readb(&dp->aux, DP_LINK_BW_SET,
> > > &dpcd_link_bw);
> > > > +	if (ret < 0) {
> > > > +		dev_err(dp->dev, "Failed to read link rate via AUX.\n");
> > > > +		kfree(*kern_buff);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	output_str_len =3D strlen(ZYNQMP_DP_DEBUGFS_UINT8_MAX_STR);
> > > > +	output_str_len =3D min(ZYNQMP_DP_DEBUGFS_READ_MAX_SIZE,
> > > output_str_len);
> > > > +	snprintf(*kern_buff, output_str_len, "%u", dpcd_link_bw);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static ssize_t zynqmp_dp_debugfs_max_lanecnt_read(char **kern_buff=
)
> > > > +{
> > > > +	struct zynqmp_dp *dp =3D dp_debugfs.dp;
> > > > +	size_t output_str_len;
> > > > +	u8 dpcd_lane_cnt;
> > > > +	int ret;
> > > > +
> > > > +	dp_debugfs.testcase =3D DP_TC_NONE;
> > > > +	dp_debugfs.lane_cnt =3D 0;
> > > > +
> > > > +	/* Getting Sink Side Lane Count */
> > > > +	ret =3D drm_dp_dpcd_readb(&dp->aux, DP_LANE_COUNT_SET,
> > > &dpcd_lane_cnt);
> > > > +	if (ret < 0) {
> > > > +		dev_err(dp->dev, "Failed to read link rate via AUX.\n");
> > > > +		kfree(*kern_buff);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	dpcd_lane_cnt &=3D DP_LANE_COUNT_MASK;
> > > > +	output_str_len =3D strlen(ZYNQMP_DP_DEBUGFS_UINT8_MAX_STR);
> > > > +	output_str_len =3D min(ZYNQMP_DP_DEBUGFS_READ_MAX_SIZE,
> > > output_str_len);
> > > > +	snprintf(*kern_buff, output_str_len, "%u", dpcd_lane_cnt);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/* Match zynqmp_dp_testcases vs dp_debugfs_reqs[] entry */
> > > > +static struct zynqmp_dp_debugfs_request debugfs_reqs[] =3D {
> > > > +	{"LINK_RATE", DP_TC_LINK_RATE,
> > > > +			zynqmp_dp_debugfs_max_linkrate_read,
> > > > +			zynqmp_dp_debugfs_max_linkrate_write},
> > > > +	{"LANE_COUNT", DP_TC_LANE_COUNT,
> > > > +			zynqmp_dp_debugfs_max_lanecnt_read,
> > > > +			zynqmp_dp_debugfs_max_lanecnt_write},
> > > > +};
> > > > +
> > > > +static ssize_t zynqmp_dp_debugfs_read(struct file *f, char __user =
*buf,
> > > > +				      size_t size, loff_t *pos)
> > > > +{
> > > > +	char *kern_buff =3D NULL;
> > > > +	size_t kern_buff_len, out_str_len;
> > > > +	enum zynqmp_dp_testcases tc;
> > > > +	int ret;
> > > > +
> > > > +	if (size <=3D 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (*pos !=3D 0)
> > > > +		return 0;
> > > > +
> > > > +	kern_buff =3D kzalloc(ZYNQMP_DP_DEBUGFS_READ_MAX_SIZE,
> > > GFP_KERNEL);
> > > > +	if (!kern_buff) {
> > > > +		dp_debugfs.testcase =3D DP_TC_NONE;
> > > > +		return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	tc =3D dp_debugfs.testcase;
> > > > +	if (tc =3D=3D DP_TC_NONE) {
> > > > +		out_str_len =3D strlen("No testcase executed");
> > > > +		out_str_len =3D min(ZYNQMP_DP_DEBUGFS_READ_MAX_SIZE,
> > > out_str_len);
> > > > +		snprintf(kern_buff, out_str_len, "%s", "No testcase
> > > executed");
> > > > +	} else {
> > > > +		ret =3D debugfs_reqs[tc].read_handler(&kern_buff);
> > > > +		if (ret) {
> > > > +			kfree(kern_buff);
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	kern_buff_len =3D strlen(kern_buff);
> > > > +	size =3D min(size, kern_buff_len);
> > > > +
> > > > +	ret =3D copy_to_user(buf, kern_buff, size);
> > > > +
> > > > +	kfree(kern_buff);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	*pos =3D size + 1;
> > > > +	return size;
> > > > +}
> > > > +
> > > > +static ssize_t
> > > > +zynqmp_dp_debugfs_write(struct file *f, const char __user *buf,
> > > > +			size_t size, loff_t *pos)
> > > > +{
> > > > +	char *kern_buff, *kern_buff_start;
> > > > +	char *dp_test_req;
> > > > +	int ret;
> > > > +	int i;
> > > > +
> > > > +	if (*pos !=3D 0 || size <=3D 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (dp_debugfs.testcase !=3D DP_TC_NONE)
> > > > +		return -EBUSY;
> > > > +
> > > > +	kern_buff =3D kzalloc(size, GFP_KERNEL);
> > > > +	if (!kern_buff)
> > > > +		return -ENOMEM;
> > > > +	kern_buff_start =3D kern_buff;
> > > > +
> > > > +	ret =3D strncpy_from_user(kern_buff, buf, size);
> > > > +	if (ret < 0) {
> > > > +		kfree(kern_buff_start);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	/* Read the testcase name and argument from a user request */
> > > > +	dp_test_req =3D strsep(&kern_buff, " ");
> > > > +
> > > > +	for (i =3D 0; i < ARRAY_SIZE(debugfs_reqs); i++) {
> > > > +		if (!strcasecmp(dp_test_req, debugfs_reqs[i].req))
> > > > +			if (!debugfs_reqs[i].write_handler(&kern_buff)) {
> > > > +				kfree(kern_buff_start);
> > > > +				return size;
> > > > +			}
> > > > +	}
> > > > +
> > > > +	kfree(kern_buff_start);
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > > +static const struct file_operations fops_zynqmp_dp_dbgfs =3D {
> > > > +	.owner =3D THIS_MODULE,
> > > > +	.read =3D zynqmp_dp_debugfs_read,
> > > > +	.write =3D zynqmp_dp_debugfs_write,
> > > > +};
> > > > +
> > > > +static int zynqmp_dp_debugfs_init(struct zynqmp_dp *dp)
> > > > +{
> > > > +	int err;
> > > > +	struct dentry *zynqmp_dp_debugfs_file;
> > > > +
> > > > +	dp_debugfs.testcase =3D DP_TC_NONE;
> > > > +	dp_debugfs.dp =3D dp;
> > > > +
> > > > +	zynqmp_dp_debugfs_dir =3D debugfs_create_dir("dp", NULL);
> > > > +	if (!zynqmp_dp_debugfs_dir) {
> > > > +		dev_err(dp->dev, "debugfs_create_dir failed\n");
> > > > +		return -ENODEV;
> > > > +	}
> > > > +
> > > > +	zynqmp_dp_debugfs_file =3D
> > > > +		debugfs_create_file("testcase", 0444,
> > > zynqmp_dp_debugfs_dir,
> > > > +				    NULL, &fops_zynqmp_dp_dbgfs);
> > > > +	if (!zynqmp_dp_debugfs_file) {
> > > > +		dev_err(dp->dev, "debugfs_create_file testcase failed\n");
> > > > +		err =3D -ENODEV;
> > > > +		goto err_dbgfs;
> > > > +	}
> > > > +	return 0;
> > > > +
> > > > +err_dbgfs:
> > > > +	debugfs_remove_recursive(zynqmp_dp_debugfs_dir);
> > > > +	zynqmp_dp_debugfs_dir =3D NULL;
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static void zynqmp_dp_debugfs_exit(struct zynqmp_dp *dp)
> > > > +{
> > > > +	debugfs_remove_recursive(zynqmp_dp_debugfs_dir);
> > > > +	zynqmp_dp_debugfs_dir =3D NULL;
> > > > +}
> > > > +
> > > > +static void zynqmp_dp_debugfs_mode_config(struct zynqmp_dp *dp)
> > > > +{
> > > > +	dp->mode.bw_code =3D
> > > > +		dp_debugfs.link_rate ? dp_debugfs.link_rate : dp-
> > > >mode.bw_code;
> > > > +	dp->mode.lane_cnt =3D
> > > > +		dp_debugfs.lane_cnt ? dp_debugfs.lane_cnt : dp-
> > > >mode.lane_cnt;
> > > > +}
> > > > +
> > > > +#else /* DRM_ZYNQMP_DP_DEBUG_FS */
> > > > +
> > > > +static int zynqmp_dp_debugfs_init(struct zynqmp_dp *dp)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void zynqmp_dp_debugfs_exit(struct zynqmp_dp *dp)
> > > > +{
> > > > +}
> > > > +
> > > > +static void zynqmp_dp_debugfs_mode_config(struct zynqmp_dp *dp)
> > > > +{
> > > > +}
> > > > +
> > > > +#endif /* DRM_ZYNQMP_DP_DEBUG_FS */
> > > > +
> > > > +/*
> > > >   * Internal functions: used by zynqmp_disp.c
> > > >   */
> > > >
> > > > @@ -597,6 +898,7 @@ static int zynqmp_dp_mode_configure(struct
> > > zynqmp_dp *dp, int pclock,
> > > >  			dp->mode.bw_code =3D bws[i];
> > > >  			dp->mode.lane_cnt =3D lane_cnt;
> > > >  			dp->mode.pclock =3D pclock;
> > > > +			zynqmp_dp_debugfs_mode_config(dp);
> > > >  			return dp->mode.bw_code;
> > > >  		}
> > > >  	}
> > > > @@ -1840,6 +2142,7 @@ int zynqmp_dp_probe(struct platform_device
> > > *pdev)
> > > >  	dpsub =3D platform_get_drvdata(pdev);
> > > >  	dpsub->dp =3D dp;
> > > >  	dp->dpsub =3D dpsub;
> > > > +	zynqmp_dp_debugfs_init(dp);
> > > >
> > > >  	return 0;
> > > >
> > > > @@ -1855,6 +2158,7 @@ int zynqmp_dp_remove(struct
> > > platform_device *pdev)
> > > >  	struct zynqmp_dpsub *dpsub =3D platform_get_drvdata(pdev);
> > > >  	struct zynqmp_dp *dp =3D dpsub->dp;
> > > >
> > > > +	zynqmp_dp_debugfs_exit(dp);
> > > >  	zynqmp_dp_write(dp->iomem, ZYNQMP_DP_TX_ENABLE, 0);
> > > >  	drm_dp_aux_unregister(&dp->aux);
> > > >  	zynqmp_dp_exit_phy(dp);
> > > > --
> > > > 2.7.4
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
