From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 6/9] Add new dtput utility to write values to fdt
Date: Sat, 3 Sep 2011 20:23:15 -0700
Message-ID: <CAPnjgZ1zSuodznKpPnsmEkwfHW72FFkX0-cYq1rfPqBy7j9X8Q@mail.gmail.com>
References: <1309892577-23828-1-git-send-email-sjg@chromium.org>
	<1309892577-23828-7-git-send-email-sjg@chromium.org>
	<20110706184626.GF4871@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110706184626.GF4871-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, Jul 6, 2011 at 11:46 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Tue, Jul 05, 2011 at 12:02:54PM -0700, Simon Glass wrote:
>> This simple utility allows writing of values into a device tree from the
>> command line.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
[snip]
>> +static void usage(const char *msg)
>> +{
>> + =A0 =A0 if (msg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Error: %s\n\n", msg);
>> + =A0 =A0 fprintf(stderr, "dtput - write a property value to a device tr=
ee\n\n");
>> + =A0 =A0 fprintf(stderr, "Usage: dtput <options> <dt file> <key> "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "[<value>...]\n");
>> + =A0 =A0 fprintf(stderr, "Options:\n");
>> + =A0 =A0 fprintf(stderr, "\t-f, --format <fmt>\tScanf format string to =
use "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "for value\n");
>> + =A0 =A0 fprintf(stderr, "\t-t, --type <typechar>\tForce type to be str=
ing "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "(s), byte(b) or int(i)\n");
>> + =A0 =A0 fprintf(stderr, "\t-h, --help\t\tPrint this help\n\n");
>> + =A0 =A0 fprintf(stderr, "\t<key> is <node>/<property>, for example "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "/lcd/width for the width\n");
>> + =A0 =A0 fprintf(stderr, "\tproperty in the LCD node\n");
>
> Can you make this text a single string and only call fprintf once? =A0It
> will be easier to reqd that way.

OK will do, thanks.

>
> It would be useful to have a mode for removing or renaming properties/nod=
es.

Yes, perhaps a -d flag to delete something (either a property or
node). I will look at this if my v2 patches pass muster.

Regards,
Simon

>
>> + =A0 =A0 exit(2);
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> + =A0 =A0 int c;
>> + =A0 =A0 int ret;
>> + =A0 =A0 char *format =3D NULL;
>> + =A0 =A0 int type =3D 0;
>> + =A0 =A0 char *filename =3D NULL;
>> + =A0 =A0 static struct option long_options[] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"format", 1, 0, 'f'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"help", 1, 0, 'h'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"type", 1, 0, 't'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"verbose", 1, 0, 'v'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {0, 0, 0, 0}
>> + =A0 =A0 };
>> +
>> + =A0 =A0 for (;;) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 c =3D getopt_long(argc, argv, "f:ht:v", long_o=
ptions, NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (c =3D=3D -1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 switch (c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 'h':
>> + =A0 =A0 =A0 =A0 =A0 =A0 case '?':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 usage(NULL);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 'f':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 format =3D optarg;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 't':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D *optarg;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 'v':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 verbose =3D 1;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (optind < argc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 filename =3D argv[optind++];
>> + =A0 =A0 if (!filename)
>> + =A0 =A0 =A0 =A0 =A0 =A0 usage("Missing filename");
>> + =A0 =A0 if (optind =3D=3D argc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 usage("Missing key(s)");
>> +
>> + =A0 =A0 ret =3D do_dtput(filename, format, type, argv + optind, argc -=
 optind);
>> + =A0 =A0 return ret;
>> +}
>> --
>> 1.7.3.1
>>
>
