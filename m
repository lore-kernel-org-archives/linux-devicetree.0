From: Nathan Lynch <Nathan_Lynch@mentor.com>
Subject: Re: [PATCH v2 4/4] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Fri, 28 Aug 2015 10:23:14 -0500
Message-ID: <55E07CE2.2050704@mentor.com>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org>
 <1440757911-9120-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440757911-9120-5-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: ohad@wizery.com, devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

On 08/28/2015 05:31 AM, Lee Jones wrote:
> +static ssize_t rproc_state_write(struct file *filp, const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct rproc *rproc = filp->private_data;
> +	char buf[2];
> +	int ret;
> +
> +	ret = copy_from_user(buf, userbuf, 1);
> +	if (ret)
> +		return -EFAULT;
> +
> +	switch (buf[0]) {
> +	case '0':
> +		rproc_shutdown(rproc);
> +		break;
> +	case '1':
> +		ret = rproc_boot(rproc);
> +		if (ret)
> +			dev_warn(&rproc->dev, "Boot failed: %d\n", ret);
> +		break;
> +	default:
> +		dev_err(&rproc->dev, "Unrecognised option: %x\n", buf[1]);
> +		return -EINVAL;

This prints uninitialized kernel stack contents instead of what was
copied from user space.

Is the dev_err statement really necessary anyway?


> +	}
> +
> +	return count;
> +}

If rproc_boot fails, that should be reflected in the syscall result.

This interface is essentially exposing the remoteproc->power refcount to
user space; is that okay?  Seems like it makes it easy to underflow
remoteproc->power through successive shutdown calls.

The other debugfs interface in remoteproc that has a write method
(recovery) accepts more expressive string commands as opposed to 0/1.
It would be more consistent for this interface to take commands such as
"boot" and "shutdown" IMO.
