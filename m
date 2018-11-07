From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 11/11] [media] marvell-ccic: provide a clock
 for the sensor
Date: Wed, 7 Nov 2018 07:42:15 +0300
Message-ID: <20181107044146.d5lsvtyjeit7goas@mwanda>
References: <20181105073054.24407-12-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <20181105073054.24407-12-lkundrak@v3.sk>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, James Cameron <quozl@laptop.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lubomir,

url:    https://github.com/0day-ci/linux/commits/Lubomir-Rintel/media-ov7670-hook-s_power-onto-v4l2-core/20181105-163336
base:   git://linuxtv.org/media_tree.git master

smatch warnings:
drivers/media/platform/marvell-ccic/mcam-core.c:1682 mcam_v4l_open() warn: inconsistent returns 'mutex:&cam->s_mutex'.
  Locked on:   line 1673
  Unlocked on: line 1682

# https://github.com/0day-ci/linux/commit/a4f7d692c7067355da433bbb534531a4e1a55ac6
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout a4f7d692c7067355da433bbb534531a4e1a55ac6
vim +1682 drivers/media/platform/marvell-ccic/mcam-core.c

abfa3df3 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-11  1656  
abfa3df3 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-11  1657  /* ---------------------------------------------------------------------- */
abfa3df3 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-11  1658  /*
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1659   * Our various file operations.
abfa3df3 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-11  1660   */
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1661  static int mcam_v4l_open(struct file *filp)
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1662  {
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1663  	struct mcam_camera *cam = video_drvdata(filp);
949bd408 drivers/media/platform/marvell-ccic/mcam-core.c Hans Verkuil    2015-03-05  1664  	int ret;
abfa3df3 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-11  1665  
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1666  	mutex_lock(&cam->s_mutex);
949bd408 drivers/media/platform/marvell-ccic/mcam-core.c Hans Verkuil    2015-03-05  1667  	ret = v4l2_fh_open(filp);
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1668  	if (ret)
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1669  		goto out;
949bd408 drivers/media/platform/marvell-ccic/mcam-core.c Hans Verkuil    2015-03-05  1670  	if (v4l2_fh_is_singular_file(filp)) {
a4f7d692 drivers/media/platform/marvell-ccic/mcam-core.c Lubomir Rintel  2018-11-05  1671  		ret = sensor_call(cam, core, s_power, 1);
05fed816 drivers/media/platform/marvell-ccic/mcam-core.c Libin Yang      2013-07-03  1672  		if (ret)
a4f7d692 drivers/media/platform/marvell-ccic/mcam-core.c Lubomir Rintel  2018-11-05  1673  			return ret;
^^^^^^^^^^
This should be a goto out;

a4f7d692 drivers/media/platform/marvell-ccic/mcam-core.c Lubomir Rintel  2018-11-05  1674  		mcam_clk_enable(cam);
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1675  		__mcam_cam_reset(cam);
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1676  		mcam_set_config_needed(cam, 1);
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1677  	}
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1678  out:
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08  1679  	mutex_unlock(&cam->s_mutex);
44fbcb10 drivers/media/platform/marvell-ccic/mcam-core.c Hans Verkuil    2015-03-05  1680  	if (ret)
44fbcb10 drivers/media/platform/marvell-ccic/mcam-core.c Hans Verkuil    2015-03-05  1681  		v4l2_fh_release(filp);
d43dae75 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-07-08 @1682  	return ret;
a9b36e85 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-20  1683  }
abfa3df3 drivers/media/video/marvell-ccic/mcam-core.c    Jonathan Corbet 2011-06-11  1684  

:::::: The code at line 1682 was first introduced by commit
:::::: d43dae75cc1140bf27a59aa6d8e8bc7a00f009cc [media] marvell-cam: core code reorganization

:::::: TO: Jonathan Corbet <corbet@lwn.net>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>
