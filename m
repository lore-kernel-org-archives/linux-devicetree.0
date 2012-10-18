From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 07/10] pinctrl: remove mutex lock in groups show
Date: Thu, 18 Oct 2012 16:26:08 -0600
Message-ID: <50808200.3080207@wwwdotorg.org>
References: <1350551224-12857-1-git-send-email-haojian.zhuang@gmail.com>
 <1350551224-12857-7-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1350551224-12857-7-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/18/2012 03:07 AM, Haojian Zhuang wrote:
> Mutex is locked duplicatly by pinconf_groups_show() and
> pin_config_group_get(). It results dead lock. So avoid to lock mutex
> in pinconf_groups_show().

With this outer lock removed, how do we ensure that the pinctrl driver
that is being called into remains loaded? Does the existence of the
debugfs file ensure this, such that if it's open, the pinctrl driver
can't be removed?

Related, I wonder if much of the variable setup at the start of the
function shouldn't happen inside the lock instead of outside:

static int pinconf_groups_show(struct seq_file *s, void *what)
{
        struct pinctrl_dev *pctldev = s->private;
        const struct pinctrl_ops *pctlops = pctldev->desc->pctlops;
        const struct pinconf_ops *ops = pctldev->desc->confops;
        unsigned ngroups = pctlops->get_groups_count(pctldev);

since what if s->private is unregistered/destroyed while this function
is running?
